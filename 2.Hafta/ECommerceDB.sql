USE [master]
GO
/****** Oluşturalcak Veritabanı isminin ve Veritabanıyla ilgili ayarların yapıldığı kısım ******/
/****** Başlangıç ******/
CREATE DATABASE [ECommerDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ECommerDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\ECommerDB.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ECommerDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\ECommerDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ECommerDB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ECommerDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ECommerDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ECommerDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ECommerDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ECommerDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ECommerDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [ECommerDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ECommerDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ECommerDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ECommerDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ECommerDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ECommerDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ECommerDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ECommerDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ECommerDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ECommerDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ECommerDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ECommerDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ECommerDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ECommerDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ECommerDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ECommerDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ECommerDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ECommerDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ECommerDB] SET  MULTI_USER 
GO
ALTER DATABASE [ECommerDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ECommerDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ECommerDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ECommerDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [ECommerDB] SET DELAYED_DURABILITY = DISABLED 
GO
/****** Bitiş ******/
/****** Oluşturalcak Veritabanı isminin ve Veritabanıyla ilgili ayarların yapıldığı kısım ******/

USE [ECommerDB]
GO
/****** Sepet işlemlerinin yapılabilmesi için [Carts] isminde tablo oluşturuyoruz ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Quantity] [int] NOT NULL,
	[CustomerUniqueId] [nvarchar](150) NULL,
	[UserId] [int] NULL,
	[ProductId] [int] NOT NULL,
 CONSTRAINT [PK_Carts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/****** Kategori tutulabilmesi için [Categories] isminde tablo oluşturuyoruz ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](max) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[LastUpDate] [datetime] NOT NULL,
	[CreateUser] [int] NOT NULL,
	[LastupUser] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsDelete] [bit] NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

/****** Yorum işlemlerinin yapılabilmesi için [Comments] isminde tablo oluşturuyoruz ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Content] [nvarchar](max) NOT NULL,
	[EmailAdress] [nvarchar](max) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[ProductId] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[LastUpDate] [datetime] NOT NULL,
	[CreateUser] [int] NOT NULL,
	[LastupUser] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsDelete] [bit] NOT NULL,
 CONSTRAINT [PK_Comments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

/****** İletişim işlemlerinin yapılabilmesi için [Contacts] isminde tablo oluşturuyoruz ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contacts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[EmailAdress] [nvarchar](250) NOT NULL,
	[Subject] [nvarchar](max) NOT NULL,
	[Message] [nvarchar](max) NOT NULL,
	[ReplyMessage] [nvarchar](max) NULL,
	[CreateDate] [datetime] NOT NULL,
	[LastUpDate] [datetime] NOT NULL,
	[CreateUser] [int] NOT NULL,
	[LastupUser] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsDelete] [bit] NOT NULL,
 CONSTRAINT [PK_Contacts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

/****** Cinsiyet işlemlerinin yapılabilmesi için [Genders] isminde tablo oluşturuyoruz ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[GenderName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Table_2] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/****** Sipariş detaylarının tutulabilmesi için [OrderDetails] isminde tablo oluşturuyoruz ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](max) NOT NULL,
	[ShowImageUrl] [nvarchar](max) NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[Quantity] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[OrderId] [int] NOT NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

/****** Sipariş işlemlerinin yapılabilmesi için [Orders] isminde tablo oluşturuyoruz ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) NULL,
	[Phone] [nvarchar](10) NULL,
	[Email] [nvarchar](200) NULL,
	[Address] [nvarchar](500) NULL,
	[City] [nvarchar](100) NULL,
	[Note] [nvarchar](1500) NULL,
	[Status] [int] NULL,
	[PaymentTypeId] [int] NULL,
	[CargoMessage] [nvarchar](max) NULL,
	[CargoName] [nvarchar](500) NULL,
	[CargoNo] [nvarchar](500) NULL,
	[CancelDescription] [nvarchar](max) NULL,
	[CreateDate] [datetime] NULL,
	[CreateUser] [int] NULL,
	[IsActive] [bit] NULL,
	[IsDelete] [bit] NULL,
	[LastUpDate] [datetime] NULL,
	[LastupUser] [int] NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

/****** Ödeme Türü işlemlerinin yapılabilmesi için [PaymentTypes] isminde tablo oluşturuyoruz ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PaymentName] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_PaymentTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

/****** Ürüne ait resimlerin tutulabilmesi için [ProductImages] isminde tablo oluşturuyoruz ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductImages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ImageURL] [nvarchar](max) NOT NULL,
	[ImageTitle] [nvarchar](max) NOT NULL,
	[ProductId] [int] NOT NULL,
 CONSTRAINT [PK_ProductImage] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

/****** Ürün bilgilerinin tutulabilmesi için [Products] isminde tablo oluşturuyoruz ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](150) NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[UnitInStok] [int] NOT NULL,
	[ShowImageUrl] [nvarchar](max) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[LastUpDate] [datetime] NULL,
	[CreateUser] [int] NOT NULL,
	[LastupUser] [int] NULL,
	[IsActive] [bit] NOT NULL,
	[IsDelete] [bit] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

/****** Rol bilgilerinin tutulabilmesi için [Rol] isminde tablo oluşturuyoruz ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/****** Kullanıcılara ait rollerin bilgilerinin tutulabilmesi için [UserRoles] isminde tablo oluşturuyoruz ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRoles](
	[UserId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
 CONSTRAINT [PK_UserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/****** Kullanıcılara ait bilgilerinin tutulabilmesi için [User] isminde tablo oluşturuyoruz ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[UserName] [nvarchar](80) NOT NULL,
	[Password] [nvarchar](30) NOT NULL,
	[ImageUrl] [nvarchar](max) NOT NULL,
	[GenderId] [int] NOT NULL,
	[Email] [nvarchar](250) NOT NULL,
	[PhoneNumber] [nvarchar](10) NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
	[AccountConfirmed] [bit] NOT NULL,
	[AccountConfirmedCode] [nvarchar](max) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Carts] ON 

/****** Tablolara örnek verilerin girildiği kısım. İsteğe bağlı bölümdür. ******/
/****** Başlangıç. ******/
INSERT [dbo].[Carts] ([Id], [Quantity], [CustomerUniqueId], [UserId], [ProductId]) VALUES (1, 1, NULL, 2, 1)
SET IDENTITY_INSERT [dbo].[Carts] OFF
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [CategoryName], [CreateDate], [LastUpDate], [CreateUser], [LastupUser], [IsActive], [IsDelete]) VALUES (1, N'Elektronik', CAST(N'2022-01-16 00:00:00.000' AS DateTime), CAST(N'2022-01-16 00:00:00.000' AS DateTime), 1, 1, 1, 0)
SET IDENTITY_INSERT [dbo].[Categories] OFF
SET IDENTITY_INSERT [dbo].[Genders] ON 

INSERT [dbo].[Genders] ([Id], [GenderName]) VALUES (1, N'Erkek')
INSERT [dbo].[Genders] ([Id], [GenderName]) VALUES (2, N'Kadın')
SET IDENTITY_INSERT [dbo].[Genders] OFF
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 

INSERT [dbo].[OrderDetails] ([Id], [ProductName], [ShowImageUrl], [Price], [Quantity], [ProductId], [OrderId]) VALUES (1, N'Laptop', N'laptop.jpg', CAST(15000.00 AS Decimal(18, 2)), 1, 1, 1)
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([Id], [Name], [Phone], [Email], [Address], [City], [Note], [Status], [PaymentTypeId], [CargoMessage], [CargoName], [CargoNo], [CancelDescription], [CreateDate], [CreateUser], [IsActive], [IsDelete], [LastUpDate], [LastupUser]) VALUES (1, N'Ömer', N'1234567890', N'omeryavas@msn.com', N'Çubuk', N'ANKARA', N'deneme', 1, 1, N'Kargoya verildgi', N'Kargo', N'123', NULL, CAST(N'2022-01-16 00:00:00.000' AS DateTime), 2, 1, 1, CAST(N'2022-02-16 00:00:00.000' AS DateTime), 2)
SET IDENTITY_INSERT [dbo].[Orders] OFF
SET IDENTITY_INSERT [dbo].[PaymentTypes] ON 

INSERT [dbo].[PaymentTypes] ([Id], [PaymentName]) VALUES (1, N'Nakit')
INSERT [dbo].[PaymentTypes] ([Id], [PaymentName]) VALUES (2, N'Kredi Kartı')
INSERT [dbo].[PaymentTypes] ([Id], [PaymentName]) VALUES (3, N'Banka Kartı')
SET IDENTITY_INSERT [dbo].[PaymentTypes] OFF
SET IDENTITY_INSERT [dbo].[ProductImages] ON 

INSERT [dbo].[ProductImages] ([Id], [ImageURL], [ImageTitle], [ProductId]) VALUES (1, N'resim1', N'resim1', 1)
INSERT [dbo].[ProductImages] ([Id], [ImageURL], [ImageTitle], [ProductId]) VALUES (3, N'resim2', N'resim2', 1)
INSERT [dbo].[ProductImages] ([Id], [ImageURL], [ImageTitle], [ProductId]) VALUES (4, N'resim3', N'resim3', 1)
SET IDENTITY_INSERT [dbo].[ProductImages] OFF
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [ProductName], [Price], [Description], [UnitInStok], [ShowImageUrl], [CategoryId], [CreateDate], [LastUpDate], [CreateUser], [LastupUser], [IsActive], [IsDelete]) VALUES (1, N'Laptop', CAST(15000.00 AS Decimal(18, 2)), N'Dizüstü Bilgisayar', 3, N'laptop.jpg', 1, CAST(N'2022-01-16 00:00:00.000' AS DateTime), CAST(N'2022-01-16 00:00:00.000' AS DateTime), 1, 1, 1, 1)
SET IDENTITY_INSERT [dbo].[Products] OFF
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([id], [RoleName]) VALUES (1, N'Admin')
INSERT [dbo].[Roles] ([id], [RoleName]) VALUES (2, N'User')
SET IDENTITY_INSERT [dbo].[Roles] OFF
INSERT [dbo].[UserRoles] ([UserId], [RoleId]) VALUES (2, 1)
INSERT [dbo].[UserRoles] ([UserId], [RoleId]) VALUES (2, 2)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [UserName], [Password], [ImageUrl], [GenderId], [Email], [PhoneNumber], [Address], [AccountConfirmed], [AccountConfirmedCode]) VALUES (1, N'Ömer', N'YAVAŞ', N'admin', N'12345', N'denemeuser.jpg', 1, N'yavas77@gmail.com', N'0123456789', N'YALOVA', 1, NULL)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [UserName], [Password], [ImageUrl], [GenderId], [Email], [PhoneNumber], [Address], [AccountConfirmed], [AccountConfirmedCode]) VALUES (2, N'Ömer', N'YAVAŞ', N'user', N'123456', N'deneme.jpg', 1, N'omeryavas@msn.com', N'1234567890', N'ANKARA', 1, NULL)

/****** Başlangıç. ******/
/****** Tablolara örnek verilerin girildiği kısım. İsteğe bağlı bölümdür. ******/


/****** Index [UK_Categories_Name] ******/
ALTER TABLE [dbo].[Categories] ADD  CONSTRAINT [UK_Categories_Name] UNIQUE NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Index [UK_Roles_Name] ******/
ALTER TABLE [dbo].[Roles] ADD  CONSTRAINT [UK_Roles_Name] UNIQUE NONCLUSTERED 
(
	[RoleName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Index [UK_Users_Email] ******/
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [UK_Users_Email] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Index [UK_Users_Name]  ******/
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [UK_Users_Name] UNIQUE NONCLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Carts]  WITH CHECK ADD  CONSTRAINT [FK_Carts_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[Carts] CHECK CONSTRAINT [FK_Carts_Products]
GO
ALTER TABLE [dbo].[Categories]  WITH CHECK ADD  CONSTRAINT [FK_Categories_Users] FOREIGN KEY([LastupUser])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Categories] CHECK CONSTRAINT [FK_Categories_Users]
GO
ALTER TABLE [dbo].[Categories]  WITH CHECK ADD  CONSTRAINT [FK_Categories_Users1] FOREIGN KEY([CreateUser])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Categories] CHECK CONSTRAINT [FK_Categories_Users1]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Products]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Users] FOREIGN KEY([CreateUser])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Users]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Users1] FOREIGN KEY([LastupUser])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Users1]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Orders] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Orders]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Products]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_PaymentTypes] FOREIGN KEY([PaymentTypeId])
REFERENCES [dbo].[PaymentTypes] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_PaymentTypes]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Users] FOREIGN KEY([LastupUser])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Users]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Users1] FOREIGN KEY([CreateUser])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Users1]
GO
ALTER TABLE [dbo].[ProductImages]  WITH CHECK ADD  CONSTRAINT [FK_ProductImages_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[ProductImages] CHECK CONSTRAINT [FK_ProductImages_Products]
GO
ALTER TABLE [dbo].[UserRoles]  WITH CHECK ADD  CONSTRAINT [FK_UserRoles_Roles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([id])
GO
ALTER TABLE [dbo].[UserRoles] CHECK CONSTRAINT [FK_UserRoles_Roles]
GO
ALTER TABLE [dbo].[UserRoles]  WITH CHECK ADD  CONSTRAINT [FK_UserRoles_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[UserRoles] CHECK CONSTRAINT [FK_UserRoles_Users]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Genders] FOREIGN KEY([GenderId])
REFERENCES [dbo].[Genders] ([Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Genders]
GO
USE [master]
GO
ALTER DATABASE [ECommerDB] SET  READ_WRITE 
GO
