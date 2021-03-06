USE [master]
GO
/****** Object:  Database [RentalCarSite]    Script Date: 10/02/2020 22:50:48 ******/
CREATE DATABASE [RentalCarSite]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'RentalCarSite', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\RentalCarSite.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'RentalCarSite_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\RentalCarSite_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [RentalCarSite] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [RentalCarSite].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [RentalCarSite] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [RentalCarSite] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [RentalCarSite] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [RentalCarSite] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [RentalCarSite] SET ARITHABORT OFF 
GO
ALTER DATABASE [RentalCarSite] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [RentalCarSite] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [RentalCarSite] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [RentalCarSite] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [RentalCarSite] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [RentalCarSite] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [RentalCarSite] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [RentalCarSite] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [RentalCarSite] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [RentalCarSite] SET  DISABLE_BROKER 
GO
ALTER DATABASE [RentalCarSite] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [RentalCarSite] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [RentalCarSite] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [RentalCarSite] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [RentalCarSite] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [RentalCarSite] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [RentalCarSite] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [RentalCarSite] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [RentalCarSite] SET  MULTI_USER 
GO
ALTER DATABASE [RentalCarSite] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [RentalCarSite] SET DB_CHAINING OFF 
GO
ALTER DATABASE [RentalCarSite] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [RentalCarSite] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [RentalCarSite] SET DELAYED_DURABILITY = DISABLED 
GO
USE [RentalCarSite]
GO
/****** Object:  Table [dbo].[Branches]    Script Date: 10/02/2020 22:50:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Branches](
	[BranchID] [int] IDENTITY(1,1) NOT NULL,
	[BranchName] [nvarchar](50) NULL,
	[Longitude] [float] NULL,
	[Latitude] [float] NULL,
	[Address] [nvarchar](50) NULL,
 CONSTRAINT [PK__Branches__A1682FA56E3072F6] PRIMARY KEY CLUSTERED 
(
	[BranchID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Cars]    Script Date: 10/02/2020 22:50:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cars](
	[CarID] [int] IDENTITY(1,1) NOT NULL,
	[CarManufacrure] [nvarchar](50) NULL,
	[CarModel] [nvarchar](50) NULL,
	[CostPerDay] [money] NULL,
	[CostPerDayLate] [money] NULL,
	[Year] [nvarchar](4) NULL,
	[Transmission] [nvarchar](10) NULL,
 CONSTRAINT [PK_Cars] PRIMARY KEY CLUSTERED 
(
	[CarID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CarsInStock]    Script Date: 10/02/2020 22:50:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CarsInStock](
	[StockID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[CarCategory] [nvarchar](50) NULL,
	[kilometer] [int] NULL,
	[CarImage] [nvarchar](50) NULL,
	[IsProper] [bit] NULL,
	[Availability] [bit] NULL,
	[CarRegistrationNumber] [nvarchar](8) NULL,
	[CarID] [int] NOT NULL,
	[BranchID] [int] NOT NULL,
 CONSTRAINT [PK__CarsInSt__2C83A9E243616FC7] PRIMARY KEY CLUSTERED 
(
	[StockID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Orders]    Script Date: 10/02/2020 22:50:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[HireDate] [date] NULL,
	[ReturnDate] [date] NULL,
	[RentEndDate] [date] NULL,
	[CarRegistrationNumber] [nvarchar](8) NULL,
	[BranchName] [nvarchar](50) NULL,
	[OrderNumber] [int] NULL,
	[UserID] [int] NOT NULL,
	[StockID] [int] NOT NULL,
 CONSTRAINT [PK__Orders__C3905BAFA4F7FBC2] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 10/02/2020 22:50:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](50) NULL,
	[PersonalID] [nvarchar](50) NULL,
	[BirthDate] [date] NULL,
	[Gender] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Role] [nvarchar](10) NULL,
	[Image] [nvarchar](50) NULL,
	[UserName] [nvarchar](50) NULL,
	[Password] [nvarchar](100) NULL,
 CONSTRAINT [PK__Users__1788CCAC6730ABA8] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Branches] ON 

INSERT [dbo].[Branches] ([BranchID], [BranchName], [Longitude], [Latitude], [Address]) VALUES (1, N'Tel-Aviv', 32.086049, 34.77467, N'Dizengoff Street 185')
INSERT [dbo].[Branches] ([BranchID], [BranchName], [Longitude], [Latitude], [Address]) VALUES (2, N'Jerusalem', 31.788759, 35.202269, N'Jaffa Street 228')
INSERT [dbo].[Branches] ([BranchID], [BranchName], [Longitude], [Latitude], [Address]) VALUES (3, N'Haifa', 32.806343, 34.957175, N'David-Elazar Street 10')
INSERT [dbo].[Branches] ([BranchID], [BranchName], [Longitude], [Latitude], [Address]) VALUES (4, N'Ramat-Gan', 32.085582, 34.810523, N'Ze''ev Jabotinsky Street')
SET IDENTITY_INSERT [dbo].[Branches] OFF
SET IDENTITY_INSERT [dbo].[Cars] ON 

INSERT [dbo].[Cars] ([CarID], [CarManufacrure], [CarModel], [CostPerDay], [CostPerDayLate], [Year], [Transmission]) VALUES (1, N'Nissan', N'Micra', 120.0000, 120.0000, N'2018', N'Automatic')
INSERT [dbo].[Cars] ([CarID], [CarManufacrure], [CarModel], [CostPerDay], [CostPerDayLate], [Year], [Transmission]) VALUES (2, N'Mazda', N'3', 160.0000, 160.0000, N'2017', N'Automatic')
INSERT [dbo].[Cars] ([CarID], [CarManufacrure], [CarModel], [CostPerDay], [CostPerDayLate], [Year], [Transmission]) VALUES (3, N'Toyota', N'AYGO', 115.0000, 115.0000, N'2018', N'Automatic')
INSERT [dbo].[Cars] ([CarID], [CarManufacrure], [CarModel], [CostPerDay], [CostPerDayLate], [Year], [Transmission]) VALUES (4, N'Hyundai', N'I10', 140.0000, 140.0000, N'2019', N'Automatic')
INSERT [dbo].[Cars] ([CarID], [CarManufacrure], [CarModel], [CostPerDay], [CostPerDayLate], [Year], [Transmission]) VALUES (5, N'Seat', N'Ibiza', 165.0000, 165.0000, N'2019', N'Automatic')
INSERT [dbo].[Cars] ([CarID], [CarManufacrure], [CarModel], [CostPerDay], [CostPerDayLate], [Year], [Transmission]) VALUES (6, N'BMW', N'530I', 1200.0000, 1200.0000, N'2020', N'Automatic')
INSERT [dbo].[Cars] ([CarID], [CarManufacrure], [CarModel], [CostPerDay], [CostPerDayLate], [Year], [Transmission]) VALUES (7, N'Skoda', N'Rapid', 190.0000, 190.0000, N'2019', N'Automatic')
INSERT [dbo].[Cars] ([CarID], [CarManufacrure], [CarModel], [CostPerDay], [CostPerDayLate], [Year], [Transmission]) VALUES (8, N'Toyota', N'Corolla', 220.0000, 220.0000, N'2019', N'Automatic')
INSERT [dbo].[Cars] ([CarID], [CarManufacrure], [CarModel], [CostPerDay], [CostPerDayLate], [Year], [Transmission]) VALUES (9, N'Skoda', N'Superb', 380.0000, 380.0000, N'2019', N'Automatic')
INSERT [dbo].[Cars] ([CarID], [CarManufacrure], [CarModel], [CostPerDay], [CostPerDayLate], [Year], [Transmission]) VALUES (10, N'Toyota', N'Verso', 430.0000, 430.0000, N'2019', N'Automatic')
INSERT [dbo].[Cars] ([CarID], [CarManufacrure], [CarModel], [CostPerDay], [CostPerDayLate], [Year], [Transmission]) VALUES (11, N'KIA', N'Niro', 200.0000, 200.0000, N'2019', N'Automatic')
INSERT [dbo].[Cars] ([CarID], [CarManufacrure], [CarModel], [CostPerDay], [CostPerDayLate], [Year], [Transmission]) VALUES (12, N'Subaru', N'Impreza', 180.0000, 180.0000, N'2018', N'Automatic')
INSERT [dbo].[Cars] ([CarID], [CarManufacrure], [CarModel], [CostPerDay], [CostPerDayLate], [Year], [Transmission]) VALUES (13, N'Mitsubishi', N'Outlander', 480.0000, 480.0000, N'2018', N'Automatic')
INSERT [dbo].[Cars] ([CarID], [CarManufacrure], [CarModel], [CostPerDay], [CostPerDayLate], [Year], [Transmission]) VALUES (14, N'Citroen', N'Berlingo ', 225.0000, 225.0000, N'2017', N'Manual')
INSERT [dbo].[Cars] ([CarID], [CarManufacrure], [CarModel], [CostPerDay], [CostPerDayLate], [Year], [Transmission]) VALUES (15, N'Hyundai', N'elantra', 200.0000, 200.0000, N'2018', N'Automatic')
INSERT [dbo].[Cars] ([CarID], [CarManufacrure], [CarModel], [CostPerDay], [CostPerDayLate], [Year], [Transmission]) VALUES (16, N'Hyundai', N'I25', 165.0000, 165.0000, N'2019', N'Automatic')
INSERT [dbo].[Cars] ([CarID], [CarManufacrure], [CarModel], [CostPerDay], [CostPerDayLate], [Year], [Transmission]) VALUES (17, N'Toyota', N'Yaris', 120.0000, 120.0000, N'2020', N'Automatic')
INSERT [dbo].[Cars] ([CarID], [CarManufacrure], [CarModel], [CostPerDay], [CostPerDayLate], [Year], [Transmission]) VALUES (18, N'Volvo ', N'S60', 1100.0000, 1100.0000, N'2020', N'Automatic')
INSERT [dbo].[Cars] ([CarID], [CarManufacrure], [CarModel], [CostPerDay], [CostPerDayLate], [Year], [Transmission]) VALUES (19, N'Nissan', N'Xtrail', 420.0000, 420.0000, N'2019', N'Manual')
INSERT [dbo].[Cars] ([CarID], [CarManufacrure], [CarModel], [CostPerDay], [CostPerDayLate], [Year], [Transmission]) VALUES (20, N'Mazda', N'CX5', 450.0000, 450.0000, N'2019', N'Automatic')
INSERT [dbo].[Cars] ([CarID], [CarManufacrure], [CarModel], [CostPerDay], [CostPerDayLate], [Year], [Transmission]) VALUES (21, N'Seat', N'Arona', 160.0000, 160.0000, N'2019', N'Manual')
INSERT [dbo].[Cars] ([CarID], [CarManufacrure], [CarModel], [CostPerDay], [CostPerDayLate], [Year], [Transmission]) VALUES (22, N'Fiat', N'Tipo', 160.0000, 160.0000, N'2019', N'Manual')
INSERT [dbo].[Cars] ([CarID], [CarManufacrure], [CarModel], [CostPerDay], [CostPerDayLate], [Year], [Transmission]) VALUES (23, N'Volvo', N'V40', 280.0000, 280.0000, N'2018', N'Manual')
INSERT [dbo].[Cars] ([CarID], [CarManufacrure], [CarModel], [CostPerDay], [CostPerDayLate], [Year], [Transmission]) VALUES (24, N'Hyundai', N'Sonata', 380.0000, 380.0000, N'2018', N'Manual')
INSERT [dbo].[Cars] ([CarID], [CarManufacrure], [CarModel], [CostPerDay], [CostPerDayLate], [Year], [Transmission]) VALUES (25, N'Chevrolet', N'Spark ', 120.0000, 120.0000, N'2019', N'Automatic')
INSERT [dbo].[Cars] ([CarID], [CarManufacrure], [CarModel], [CostPerDay], [CostPerDayLate], [Year], [Transmission]) VALUES (26, N'Honda', N'CRV', 750.0000, 750.0000, N'2017', N'Manual')
INSERT [dbo].[Cars] ([CarID], [CarManufacrure], [CarModel], [CostPerDay], [CostPerDayLate], [Year], [Transmission]) VALUES (27, N'Honda', N'Jazz', 140.0000, 140.0000, N'2017', N'Manual')
INSERT [dbo].[Cars] ([CarID], [CarManufacrure], [CarModel], [CostPerDay], [CostPerDayLate], [Year], [Transmission]) VALUES (28, N'Mazda', N'6', 400.0000, 400.0000, N'2018', N'Manual')
INSERT [dbo].[Cars] ([CarID], [CarManufacrure], [CarModel], [CostPerDay], [CostPerDayLate], [Year], [Transmission]) VALUES (29, N'Honda', N'Civic', 215.0000, 215.0000, N'2019', N'Automatic')
INSERT [dbo].[Cars] ([CarID], [CarManufacrure], [CarModel], [CostPerDay], [CostPerDayLate], [Year], [Transmission]) VALUES (30, N'Kia', N'Sportage', 260.0000, 260.0000, N'2020', N'Manual')
SET IDENTITY_INSERT [dbo].[Cars] OFF
SET IDENTITY_INSERT [dbo].[CarsInStock] ON 

INSERT [dbo].[CarsInStock] ([StockID], [CarCategory], [kilometer], [CarImage], [IsProper], [Availability], [CarRegistrationNumber], [CarID], [BranchID]) VALUES (1, N'Compact', 5000, N'fff9cfb3-67b1-4ab9-a3cd-b54921322d9c.jpg', 1, NULL, N'90609060', 1, 1)
INSERT [dbo].[CarsInStock] ([StockID], [CarCategory], [kilometer], [CarImage], [IsProper], [Availability], [CarRegistrationNumber], [CarID], [BranchID]) VALUES (3, N'Family', 15000, N'fc92fb4d-e398-4b7d-a055-d03d142a26e5.jpg', 1, NULL, N'20505020', 1, 1)
INSERT [dbo].[CarsInStock] ([StockID], [CarCategory], [kilometer], [CarImage], [IsProper], [Availability], [CarRegistrationNumber], [CarID], [BranchID]) VALUES (4, N'Compact', 10000, N'36f23a9a-6643-454f-9ac9-e60be6ad6bf1.jpg', 1, NULL, N'55664433', 1, 1)
INSERT [dbo].[CarsInStock] ([StockID], [CarCategory], [kilometer], [CarImage], [IsProper], [Availability], [CarRegistrationNumber], [CarID], [BranchID]) VALUES (5, N'Family', 10000, N'1375a299-d8cd-4df9-87a9-f7ba8080ff5d.jpg', 1, NULL, N'20205080', 2, 2)
INSERT [dbo].[CarsInStock] ([StockID], [CarCategory], [kilometer], [CarImage], [IsProper], [Availability], [CarRegistrationNumber], [CarID], [BranchID]) VALUES (6, N'Compact', 4000, N'67ad406f-5f83-4074-a830-69df1ed4b7ab.jpg', 1, 1, N'30255203', 5, 2)
INSERT [dbo].[CarsInStock] ([StockID], [CarCategory], [kilometer], [CarImage], [IsProper], [Availability], [CarRegistrationNumber], [CarID], [BranchID]) VALUES (7, N'Executive', 10000, N'd31d43bf-1ed1-44e8-8916-d7947deda2c3.jpg', 1, 1, N'95989796', 6, 2)
INSERT [dbo].[CarsInStock] ([StockID], [CarCategory], [kilometer], [CarImage], [IsProper], [Availability], [CarRegistrationNumber], [CarID], [BranchID]) VALUES (8, N'Family', 8500, N'331244b4-1a8e-4224-b46d-e5f98c8df0e1.jpg', 0, 1, N'88997788', 7, 3)
INSERT [dbo].[CarsInStock] ([StockID], [CarCategory], [kilometer], [CarImage], [IsProper], [Availability], [CarRegistrationNumber], [CarID], [BranchID]) VALUES (9, N'Family', 10000, N'196b9b0a-267d-4760-8006-35c025232cba.jpg', 1, 1, N'44448888', 8, 3)
INSERT [dbo].[CarsInStock] ([StockID], [CarCategory], [kilometer], [CarImage], [IsProper], [Availability], [CarRegistrationNumber], [CarID], [BranchID]) VALUES (11, N'Family', 20000, N'5fc6f597-8928-449f-b812-0fc7a48f776c.jpg', 1, 0, N'55446655', 10, 2)
INSERT [dbo].[CarsInStock] ([StockID], [CarCategory], [kilometer], [CarImage], [IsProper], [Availability], [CarRegistrationNumber], [CarID], [BranchID]) VALUES (12, N'Family', 35000, N'749c9c3e-cfc4-442c-b027-06c90d78a055.jpg', 1, 0, N'60500506', 11, 2)
INSERT [dbo].[CarsInStock] ([StockID], [CarCategory], [kilometer], [CarImage], [IsProper], [Availability], [CarRegistrationNumber], [CarID], [BranchID]) VALUES (13, N'Family', 35000, N'df83fae0-e052-478f-bcaf-11e082c2fde5.jpg', 1, 1, N'90459045', 12, 1)
INSERT [dbo].[CarsInStock] ([StockID], [CarCategory], [kilometer], [CarImage], [IsProper], [Availability], [CarRegistrationNumber], [CarID], [BranchID]) VALUES (14, N'SUV', 1000, N'2fc660de-723b-4a10-aaee-d4a1eee857e2.jpg', 1, 1, N'40651953', 13, 2)
INSERT [dbo].[CarsInStock] ([StockID], [CarCategory], [kilometer], [CarImage], [IsProper], [Availability], [CarRegistrationNumber], [CarID], [BranchID]) VALUES (15, N'Pick-up Truck', 8500, N'461c8dfb-635f-4c00-9e18-7cc95994aaf7.jpg', 0, 0, N'36957515', 14, 1)
SET IDENTITY_INSERT [dbo].[CarsInStock] OFF
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([OrderID], [HireDate], [ReturnDate], [RentEndDate], [CarRegistrationNumber], [BranchName], [OrderNumber], [UserID], [StockID]) VALUES (1, CAST(N'2020-01-30' AS Date), CAST(N'2020-02-08' AS Date), CAST(N'2020-02-08' AS Date), N'90609060', N'Tel-Aviv', 10001, 1, 1)
INSERT [dbo].[Orders] ([OrderID], [HireDate], [ReturnDate], [RentEndDate], [CarRegistrationNumber], [BranchName], [OrderNumber], [UserID], [StockID]) VALUES (3, CAST(N'2020-01-30' AS Date), CAST(N'2020-02-06' AS Date), CAST(N'2020-02-06' AS Date), N'20505020', N'Tel-Aviv', 10003, 2, 3)
INSERT [dbo].[Orders] ([OrderID], [HireDate], [ReturnDate], [RentEndDate], [CarRegistrationNumber], [BranchName], [OrderNumber], [UserID], [StockID]) VALUES (7, CAST(N'2020-01-01' AS Date), NULL, NULL, N'95989796', N'Jerusalem', 10025, 2, 7)
INSERT [dbo].[Orders] ([OrderID], [HireDate], [ReturnDate], [RentEndDate], [CarRegistrationNumber], [BranchName], [OrderNumber], [UserID], [StockID]) VALUES (8, CAST(N'2020-02-02' AS Date), CAST(N'2020-02-12' AS Date), CAST(N'2020-02-12' AS Date), N'20205080', N'Jerusalem', 10008, 2, 5)
INSERT [dbo].[Orders] ([OrderID], [HireDate], [ReturnDate], [RentEndDate], [CarRegistrationNumber], [BranchName], [OrderNumber], [UserID], [StockID]) VALUES (9, CAST(N'2020-01-03' AS Date), CAST(N'2020-01-10' AS Date), CAST(N'2020-01-10' AS Date), N'30255203', N'Jerusalem', 10009, 2, 6)
INSERT [dbo].[Orders] ([OrderID], [HireDate], [ReturnDate], [RentEndDate], [CarRegistrationNumber], [BranchName], [OrderNumber], [UserID], [StockID]) VALUES (10, CAST(N'2020-01-01' AS Date), CAST(N'2020-01-09' AS Date), CAST(N'2020-01-09' AS Date), N'95989796', N'Jerusalem', 10010, 2, 7)
INSERT [dbo].[Orders] ([OrderID], [HireDate], [ReturnDate], [RentEndDate], [CarRegistrationNumber], [BranchName], [OrderNumber], [UserID], [StockID]) VALUES (11, CAST(N'2020-01-15' AS Date), CAST(N'2020-01-17' AS Date), CAST(N'2020-01-17' AS Date), N'88997788', N'Ramat-Gan', 10011, 2, 8)
INSERT [dbo].[Orders] ([OrderID], [HireDate], [ReturnDate], [RentEndDate], [CarRegistrationNumber], [BranchName], [OrderNumber], [UserID], [StockID]) VALUES (12, CAST(N'2020-01-16' AS Date), CAST(N'2020-01-19' AS Date), CAST(N'2020-01-19' AS Date), N'44448888', N'Ramat-Gan', 10012, 2, 9)
INSERT [dbo].[Orders] ([OrderID], [HireDate], [ReturnDate], [RentEndDate], [CarRegistrationNumber], [BranchName], [OrderNumber], [UserID], [StockID]) VALUES (13, CAST(N'2020-02-01' AS Date), CAST(N'2020-02-02' AS Date), CAST(N'2020-02-03' AS Date), N'55446655', N'Jerusalem', 10013, 2, 11)
INSERT [dbo].[Orders] ([OrderID], [HireDate], [ReturnDate], [RentEndDate], [CarRegistrationNumber], [BranchName], [OrderNumber], [UserID], [StockID]) VALUES (14, CAST(N'2020-02-01' AS Date), CAST(N'2020-02-04' AS Date), CAST(N'2020-02-06' AS Date), N'60500506', N'Tel-Aviv', 10014, 2, 12)
INSERT [dbo].[Orders] ([OrderID], [HireDate], [ReturnDate], [RentEndDate], [CarRegistrationNumber], [BranchName], [OrderNumber], [UserID], [StockID]) VALUES (15, CAST(N'2020-01-03' AS Date), CAST(N'2020-01-10' AS Date), CAST(N'2020-01-11' AS Date), N'90459045', N'Tel-Aviv', 10015, 4, 13)
INSERT [dbo].[Orders] ([OrderID], [HireDate], [ReturnDate], [RentEndDate], [CarRegistrationNumber], [BranchName], [OrderNumber], [UserID], [StockID]) VALUES (16, NULL, NULL, NULL, N'40651953', N'Ramat-Gan', 10016, 8, 14)
INSERT [dbo].[Orders] ([OrderID], [HireDate], [ReturnDate], [RentEndDate], [CarRegistrationNumber], [BranchName], [OrderNumber], [UserID], [StockID]) VALUES (17, NULL, NULL, NULL, N'36957515', N'Tel-Aviv', 10017, 2, 15)
INSERT [dbo].[Orders] ([OrderID], [HireDate], [ReturnDate], [RentEndDate], [CarRegistrationNumber], [BranchName], [OrderNumber], [UserID], [StockID]) VALUES (43, CAST(N'2020-02-06' AS Date), CAST(N'2020-02-14' AS Date), CAST(N'2020-02-14' AS Date), N'44448888', N'Ramat-Gan', 10028, 8, 9)
INSERT [dbo].[Orders] ([OrderID], [HireDate], [ReturnDate], [RentEndDate], [CarRegistrationNumber], [BranchName], [OrderNumber], [UserID], [StockID]) VALUES (44, CAST(N'2020-02-05' AS Date), CAST(N'2020-02-13' AS Date), CAST(N'2020-02-13' AS Date), N'88997788', N'Ramat-Gan', 10029, 8, 8)
INSERT [dbo].[Orders] ([OrderID], [HireDate], [ReturnDate], [RentEndDate], [CarRegistrationNumber], [BranchName], [OrderNumber], [UserID], [StockID]) VALUES (45, CAST(N'2020-02-06' AS Date), CAST(N'2020-02-13' AS Date), CAST(N'2020-02-13' AS Date), N'55446655', N'Jerusalem', 10030, 8, 11)
INSERT [dbo].[Orders] ([OrderID], [HireDate], [ReturnDate], [RentEndDate], [CarRegistrationNumber], [BranchName], [OrderNumber], [UserID], [StockID]) VALUES (46, CAST(N'2020-02-06' AS Date), CAST(N'2020-02-13' AS Date), CAST(N'2020-02-13' AS Date), N'30255203', N'Jerusalem', 10031, 8, 6)
INSERT [dbo].[Orders] ([OrderID], [HireDate], [ReturnDate], [RentEndDate], [CarRegistrationNumber], [BranchName], [OrderNumber], [UserID], [StockID]) VALUES (47, CAST(N'2020-02-05' AS Date), CAST(N'2020-02-13' AS Date), CAST(N'2020-02-13' AS Date), N'60500506', N'Tel-Aviv', 10032, 8, 12)
INSERT [dbo].[Orders] ([OrderID], [HireDate], [ReturnDate], [RentEndDate], [CarRegistrationNumber], [BranchName], [OrderNumber], [UserID], [StockID]) VALUES (48, CAST(N'2020-02-19' AS Date), CAST(N'2020-02-20' AS Date), CAST(N'2020-02-20' AS Date), N'20205080', N'Jerusalem', 10033, 8, 5)
INSERT [dbo].[Orders] ([OrderID], [HireDate], [ReturnDate], [RentEndDate], [CarRegistrationNumber], [BranchName], [OrderNumber], [UserID], [StockID]) VALUES (49, CAST(N'2020-03-03' AS Date), CAST(N'2020-03-13' AS Date), CAST(N'2020-03-13' AS Date), N'30255203', N'Jerusalem', 10034, 8, 6)
INSERT [dbo].[Orders] ([OrderID], [HireDate], [ReturnDate], [RentEndDate], [CarRegistrationNumber], [BranchName], [OrderNumber], [UserID], [StockID]) VALUES (50, CAST(N'2020-04-08' AS Date), CAST(N'2020-04-16' AS Date), CAST(N'2020-04-16' AS Date), N'30255203', N'Jerusalem', 10019, 8, 6)
INSERT [dbo].[Orders] ([OrderID], [HireDate], [ReturnDate], [RentEndDate], [CarRegistrationNumber], [BranchName], [OrderNumber], [UserID], [StockID]) VALUES (57, CAST(N'2020-05-13' AS Date), CAST(N'2020-05-14' AS Date), CAST(N'2020-05-14' AS Date), N'90459045', N'Tel-Aviv', 10027, 2, 13)
SET IDENTITY_INSERT [dbo].[Orders] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserID], [FullName], [PersonalID], [BirthDate], [Gender], [Email], [Role], [Image], [UserName], [Password]) VALUES (1, N'David Cohen', N'852741963', CAST(N'1983-09-15' AS Date), N'Male', N'David@gmail.com', N'Customer', NULL, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [FullName], [PersonalID], [BirthDate], [Gender], [Email], [Role], [Image], [UserName], [Password]) VALUES (2, N'Shimon Levi', N'258147456', CAST(N'1997-06-30' AS Date), N'Male', N'Shimon@gmail.com', N'Employee', NULL, N'ShimonL', N'101010')
INSERT [dbo].[Users] ([UserID], [FullName], [PersonalID], [BirthDate], [Gender], [Email], [Role], [Image], [UserName], [Password]) VALUES (3, N'Haim Moshe', N'591537485', CAST(N'1993-03-27' AS Date), N'Male', N'Haim@gmail.com', N'Customer', NULL, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [FullName], [PersonalID], [BirthDate], [Gender], [Email], [Role], [Image], [UserName], [Password]) VALUES (4, N'Noa Rozen', N'649824167', CAST(N'1977-06-16' AS Date), N'Female', N'Noa@gmail.com', N'Employee', NULL, N'RozenN', N'87654321')
INSERT [dbo].[Users] ([UserID], [FullName], [PersonalID], [BirthDate], [Gender], [Email], [Role], [Image], [UserName], [Password]) VALUES (5, N'Sarit Zribi', N'857695813', CAST(N'1986-01-25' AS Date), N'Female', N'Sarit@gmail.com', N'Customer', NULL, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [FullName], [PersonalID], [BirthDate], [Gender], [Email], [Role], [Image], [UserName], [Password]) VALUES (6, N'Roni Perez', N'123541214', CAST(N'1990-03-08' AS Date), N'Female', N'Roni@gmail.com', N'Customer', NULL, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [FullName], [PersonalID], [BirthDate], [Gender], [Email], [Role], [Image], [UserName], [Password]) VALUES (7, N'Yossi Shefer', N'987159753', CAST(N'1999-03-27' AS Date), N'Male', N'Yossi@gmail.com', N'Customer', NULL, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [FullName], [PersonalID], [BirthDate], [Gender], [Email], [Role], [Image], [UserName], [Password]) VALUES (8, N'Elran Solemanyan', N'666555444', CAST(N'1985-07-22' AS Date), N'Male', N'Elran@gmail.com', N'Admin', NULL, N'elran', N'123456')
SET IDENTITY_INSERT [dbo].[Users] OFF
ALTER TABLE [dbo].[CarsInStock]  WITH CHECK ADD  CONSTRAINT [FK_CarsInStock_Branches] FOREIGN KEY([BranchID])
REFERENCES [dbo].[Branches] ([BranchID])
GO
ALTER TABLE [dbo].[CarsInStock] CHECK CONSTRAINT [FK_CarsInStock_Branches]
GO
ALTER TABLE [dbo].[CarsInStock]  WITH CHECK ADD  CONSTRAINT [FK_CarsInStock_Cars] FOREIGN KEY([CarID])
REFERENCES [dbo].[Cars] ([CarID])
GO
ALTER TABLE [dbo].[CarsInStock] CHECK CONSTRAINT [FK_CarsInStock_Cars]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_CarsInStock] FOREIGN KEY([StockID])
REFERENCES [dbo].[CarsInStock] ([StockID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_CarsInStock]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Users]
GO
/****** Object:  StoredProcedure [dbo].[AddCar]    Script Date: 10/02/2020 22:50:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[AddCar] 
(@manufacture nvarchar(50),
@model nvarchar (50), 
@dailyCost money, 
@lateCost money,
@year nvarchar(4), 
@transmission nvarchar (10))
as
insert into Cars(CarManufacrure,CarModel,CostPerDay,CostPerDayLate,Year, Transmission)
values (@manufacture,@model, @dailyCost, @lateCost,@year,@transmission)

GO
/****** Object:  StoredProcedure [dbo].[AddCarInStock]    Script Date: 10/02/2020 22:50:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[AddCarInStock] 
(@cCategory nvarchar(50),
@kilometer int, 
@cImage nvarchar (50), 
@proper bit,
@availability bit, 
@cRegistrationNumber nvarchar (8),
@branchID int,
@carId int)
as
insert into CarsInStock(
CarCategory,
kilometer,
CarImage,
IsProper,
Availability,
CarRegistrationNumber,
BranchID,
CarID)
values(@cCategory,
@kilometer, 
@cImage, 
@proper,
@availability,
@cRegistrationNumber,
@branchID,
@carId)

GO
/****** Object:  StoredProcedure [dbo].[AddOrder]    Script Date: 10/02/2020 22:50:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[AddOrder] (
@hireDate date,
@returnDate date,
@rentEndDate date,
@carRegistrationNumber nvarchar(8),
@branchName nvarchar(50),
@orderNumber int,
@userNumber int,
@userId int,
@stockId int
)
as insert into Orders (
HireDate,
ReturnDate,
RentEndDate, 
CarRegistrationNumber,
BranchName,
OrderNumber,
UserNumber,
UserID,
StockID)
values(@hireDate,
@returnDate,
@rentEndDate,
@carRegistrationNumber, 
@branchName,
@orderNumber,
@userNumber,
@userId,
@stockId) 

GO
/****** Object:  StoredProcedure [dbo].[AddUser]    Script Date: 10/02/2020 22:50:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[AddUser]
	(@fName nvarchar(50),
	@personalId nvarchar(50),
	@birthdate date,
	@gender nvarchar(50),
	@eMail nvarchar(50),
	@role nvarchar (10),
	@image nvarchar(50),
	@userName nvarchar (50),
	@password nvarchar (100))
	as insert into  Users
	(FullName,
	PersonalID,
	BirthDate,Gender,
	Email,
	Role,
	Image,
	UserName,
	Password)
	values(@fName,
	@personalId,
	@birthdate,
	@gender,
	@eMail,
	@role,
	@image,
	@userName,
	@password) 

GO
/****** Object:  StoredProcedure [dbo].[DeleteCar]    Script Date: 10/02/2020 22:50:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[DeleteCar] (@id int)
as
delete from Cars where CarID = @id

GO
/****** Object:  StoredProcedure [dbo].[DeleteCarInStock]    Script Date: 10/02/2020 22:50:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[DeleteCarInStock] (@id int)
as
delete from CarsInStock where StockID = @id

GO
/****** Object:  StoredProcedure [dbo].[DeleteOrder]    Script Date: 10/02/2020 22:50:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[DeleteOrder] (@id int)
as delete from Orders where OrderID=@id

GO
/****** Object:  StoredProcedure [dbo].[DeleteUser]    Script Date: 10/02/2020 22:50:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[DeleteUser] (@id int) as
	delete from Users where UserID=@id

GO
/****** Object:  StoredProcedure [dbo].[GetAvailableCarsToRent]    Script Date: 10/02/2020 22:50:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetAvailableCarsToRent](@startDate date, @endDate date) as
BEGIN
	select 
		CarsInStock.StockID, 
		Year, 
		CostPerDay, 
		CostPerDayLate, 
			CarModel, 
		CarManufacrure, 
		Transmission, 
		CarImage, 
		CarsInStock.CarRegistrationNumber, 
		CarCategory,
		Branches.BranchName,
		Address
	from Cars
	left join CarsInStock on Cars.CarID = CarsInStock.CarID
	left join Orders ord on CarsInStock.StockID = ord.StockID 
	left join Branches on CarsInStock.BranchID = Branches.BranchID
	where 
		not ((ord.HireDate <= @startDate and ord.ReturnDate >= @startDate) or 
		(ord.HireDate <= @endDate and   ord.ReturnDate >= @endDate) or 
		(ord.HireDate >= @startDate and ord.ReturnDate <= @endDate))
	
END
GO
/****** Object:  StoredProcedure [dbo].[GetAvailableOneCarToRent]    Script Date: 10/02/2020 22:50:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetAvailableOneCarToRent](@startDate date, @endDate date, @registrationNum nvarchar(8) ) as
select CarsInStock.CarID, Year, CostPerDay, CostPerDayLate, CarModel, CarManufacrure, Transmission, CarImage,CarsInStock.CarRegistrationNumber,OrderNumber
from Cars join CarsInStock on Cars.CarID = CarsInStock.CarID
join Orders on CarsInStock.StockID=Orders.StockID
where Orders.CarRegistrationNumber=@registrationNum and
 CarsInStock.StockID=Orders.StockID and  Orders.StockID not in (select Orders.StockID from Orders where
 (HireDate <= @startDate and ReturnDate >= @startDate)
  or (HireDate <= @endDate and ReturnDate >= @endDate) or 
  (HireDate >= @startDate and ReturnDate <= @endDate))


GO
/****** Object:  StoredProcedure [dbo].[GetMaxOrderNumber]    Script Date: 10/02/2020 22:50:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetMaxOrderNumber] as
  select MAX(OrderNumber)from Orders

GO
/****** Object:  StoredProcedure [dbo].[SetAvailability]    Script Date: 10/02/2020 22:50:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SetAvailability] (@availability bit, @cRegistrationNum nvarchar(8))
as
update CarsInStock set Availability= @availability where CarRegistrationNumber=@cRegistrationNum

GO
/****** Object:  StoredProcedure [dbo].[UpdateCar]    Script Date: 10/02/2020 22:50:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[UpdateCar] 
(@id int,
@manufacture nvarchar(50),
@model nvarchar (50), 
@dailyCost money, 
@lateCost money,
@year nvarchar(4), 
@transmission nvarchar (10))
as
update Cars set 
CarManufacrure =@manufacture,
CarModel=@model,
CostPerDay=@dailyCost,
CostPerDayLate=@lateCost,
Year =@year,
Transmission=@transmission where CarID= @id

GO
/****** Object:  StoredProcedure [dbo].[UpdateCarInStock]    Script Date: 10/02/2020 22:50:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[UpdateCarInStock]
(@id int,
@cCategory nvarchar(50),
@kilometer int, 
@cImage nvarchar (50), 
@proper bit,
@availability bit, 
@cRegistrationNumber nvarchar (8),
@branchId int,
@carId int)
as
update CarsInStock set 
CarCategory =@cCategory,
kilometer=@kilometer,
CarImage= @cImage,
IsProper= @proper,
Availability=@availability,
CarRegistrationNumber=@cRegistrationNumber,
BranchID=@branchId,
CarID=@carId
where StockID= @id

GO
/****** Object:  StoredProcedure [dbo].[UpdateOrder]    Script Date: 10/02/2020 22:50:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[UpdateOrder] (
@id int,
@hireDate date,
@returnDate date,
@rentEndDate date,
@carRegistrationNumber nvarchar(8),
@branchName nvarchar(50),
@orderNumber int,
@userNumber int,
@userId int,
@stockId int
)
as update Orders set
HireDate=@hireDate,
ReturnDate=@returnDate,
RentEndDate=@rentEndDate,
CarRegistrationNumber=@carRegistrationNumber,
BranchName=@branchName,
OrderNumber=@orderNumber,
UserNumber=@userId,
StockID=@stockId 
where OrderID =@id 

GO
/****** Object:  StoredProcedure [dbo].[UpdateUser]    Script Date: 10/02/2020 22:50:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[UpdateUser] (
	@id int,
	@fName nvarchar(50),
	@personalId nvarchar(50),
	@birthdate date,
	@gender nvarchar(50),
	@eMail nvarchar(50),
	@role nvarchar (10),
	@image nvarchar(50),
	@userName nvarchar (50),
	@password nvarchar (100)
	
	)as update Users set FullName = @fName,
	PersonalID=@personalId,
	BirthDate=@birthdate,
	Gender=@gender,
	Email=@eMail,
	Role=@role,
	Image=@role,
	UserName=@userName,
	Password=@password where UserID=@id

GO
USE [master]
GO
ALTER DATABASE [RentalCarSite] SET  READ_WRITE 
GO
