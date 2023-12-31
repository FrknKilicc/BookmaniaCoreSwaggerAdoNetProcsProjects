USE [master]
GO
/****** Object:  Database [BookmaniaDB]    Script Date: 22.11.2023 18:04:46 ******/
CREATE DATABASE [BookmaniaDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BookmaniaDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.FURKANKILIC\MSSQL\DATA\BookmaniaDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BookmaniaDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.FURKANKILIC\MSSQL\DATA\BookmaniaDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [BookmaniaDB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BookmaniaDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BookmaniaDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BookmaniaDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BookmaniaDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BookmaniaDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BookmaniaDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [BookmaniaDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BookmaniaDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BookmaniaDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BookmaniaDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BookmaniaDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BookmaniaDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BookmaniaDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BookmaniaDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BookmaniaDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BookmaniaDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BookmaniaDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BookmaniaDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BookmaniaDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BookmaniaDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BookmaniaDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BookmaniaDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BookmaniaDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BookmaniaDB] SET RECOVERY FULL 
GO
ALTER DATABASE [BookmaniaDB] SET  MULTI_USER 
GO
ALTER DATABASE [BookmaniaDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BookmaniaDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BookmaniaDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BookmaniaDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BookmaniaDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BookmaniaDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'BookmaniaDB', N'ON'
GO
ALTER DATABASE [BookmaniaDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [BookmaniaDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [BookmaniaDB]
GO
/****** Object:  Table [dbo].[Books]    Script Date: 22.11.2023 18:04:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Books](
	[BookId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NULL,
	[Author] [nvarchar](50) NULL,
	[Genre] [nvarchar](50) NULL,
	[PublishedYear] [int] NULL,
 CONSTRAINT [PK__Books__3DE0C207B069AC82] PRIMARY KEY CLUSTERED 
(
	[BookId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 22.11.2023 18:04:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerId] [int] NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[Email] [nvarchar](100) NULL,
	[Address] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 22.11.2023 18:04:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderId] [int] NOT NULL,
	[OrderDate] [date] NULL,
	[CustomerId] [int] NULL,
	[TotalAmount] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 22.11.2023 18:04:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductId] [int] NOT NULL,
	[Namee] [nvarchar](100) NULL,
	[Price] [float] NULL,
	[Descriptionn] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Books] ON 

INSERT [dbo].[Books] ([BookId], [Title], [Author], [Genre], [PublishedYear]) VALUES (1, N'deneme', N'deneme', N'deneme', 2020)
SET IDENTITY_INSERT [dbo].[Books] OFF
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customers] ([CustomerId])
GO
/****** Object:  StoredProcedure [dbo].[CRUD]    Script Date: 22.11.2023 18:04:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[CRUD] 

@BookId int,
@Title nvarchar(50),
@Author NVARCHAR(50),
@Genre NVARCHAR(50),
@PublishedYear int,
@transactionn varchar(50)
as begin 
if	(@transactionn='insert')
begin 
insert into Books (Title,Author,Genre,PublishedYear) 
values (@Title,@Author,@Genre,@PublishedYear)
end
else if	(@transactionn = 'update')
begin
update Books set Title=@Title, Author=@Author,Genre=@Genre,PublishedYear=@PublishedYear
where BookId=@BookId
end
else if (@transactionn='delete')
begin 
delete from Books where BookId=@BookId
end
end
GO
/****** Object:  StoredProcedure [dbo].[CRUDCustomers]    Script Date: 22.11.2023 18:04:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[CRUDCustomers]

@CustomerId int,
@FirstName nvarchar(50),
@LastName NVARCHAR(50),
@Email NVARCHAR(100),
@transactionn varchar(50)
as begin 
if(@transactionn='insert')
begin
insert into Customers(FirstName,LastName,Email) values (@CustomerId,@FirstName,@LastName)
end
else if(@transactionn='update')
begin
update Customers set FirstName=@FirstName, LastName=@LastName,Email=@Email where CustomerId=@CustomerId
end
else if(@transactionn='delete')
begin
delete from Customers where CustomerId=@CustomerId 
end
end
GO
/****** Object:  StoredProcedure [dbo].[CRUDOrders]    Script Date: 22.11.2023 18:04:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[CRUDOrders]
@OrderId INT,
@OrderDate DATE,
@CustomerId INT,
@TotalAmount float,
@transactionn varchar(50)
as begin 
if (@transactionn='insert')
begin
insert into Orders (OrderDate,CustomerId,TotalAmount) values (@OrderDate,@CustomerId,@TotalAmount)
end
else if(@transactionn='update')
begin
update Orders set OrderDate=@OrderDate, CustomerId=@CustomerId,TotalAmount=@TotalAmount where OrderId=@OrderId
end
else if(@transactionn='delete')
begin
delete from Orders where OrderId=@OrderId 
end
end
GO
/****** Object:  StoredProcedure [dbo].[CRUDProducts]    Script Date: 22.11.2023 18:04:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[CRUDProducts]
@ProductId INT,
@Name NVARCHAR(100),
@Price float,
@Description NVARCHAR(200),
@transactionn varchar(50)
as begin
if(@transactionn='insert')
begin
insert into Products(Namee,Price,Descriptionn)
values (@Name,@Price,@Description)
end
else if (@transactionn='update')
begin
update Products set @Name=Namee,@Price=Price,@Description=Descriptionn where ProductId=@ProductId
end
else if(@transactionn='delete')
begin 
delete from Products where ProductId=@ProductId
end
end
GO
/****** Object:  StoredProcedure [dbo].[listBook]    Script Date: 22.11.2023 18:04:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[listBook] 
as begin
select*from Books
end
GO
/****** Object:  StoredProcedure [dbo].[ListCustomers]    Script Date: 22.11.2023 18:04:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[ListCustomers]
as begin 
select*from Customers
end
GO
/****** Object:  StoredProcedure [dbo].[ListOrders]    Script Date: 22.11.2023 18:04:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[ListOrders]
as begin
select*from Orders
end
GO
/****** Object:  StoredProcedure [dbo].[ListProducts]    Script Date: 22.11.2023 18:04:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[ListProducts]
as begin
select*from Products
end
GO
USE [master]
GO
ALTER DATABASE [BookmaniaDB] SET  READ_WRITE 
GO
