USE [master]
GO
/****** Object:  Database [ADproject]    Script Date: 14/1/2018 6:56:23 PM ******/
CREATE DATABASE [ADproject]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ADproject', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\ADproject.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ADproject_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\ADproject_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ADproject] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ADproject].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ADproject] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ADproject] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ADproject] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ADproject] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ADproject] SET ARITHABORT OFF 
GO
ALTER DATABASE [ADproject] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ADproject] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ADproject] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ADproject] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ADproject] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ADproject] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ADproject] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ADproject] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ADproject] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ADproject] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ADproject] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ADproject] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ADproject] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ADproject] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ADproject] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ADproject] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ADproject] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ADproject] SET RECOVERY FULL 
GO
ALTER DATABASE [ADproject] SET  MULTI_USER 
GO
ALTER DATABASE [ADproject] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ADproject] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ADproject] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ADproject] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [ADproject] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ADproject', N'ON'
GO
USE [ADproject]
GO
/****** Object:  Table [dbo].[Adjustment Voucher Record]    Script Date: 14/1/2018 6:56:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Adjustment Voucher Record](
	[voucherID] [int] NOT NULL,
	[issueDate] [date] NOT NULL,
	[handlingStaffID] [nvarchar](50) NOT NULL,
	[authorisingStaffID] [nvarchar](50) NULL,
	[status] [nvarchar](50) NOT NULL,
	[remarks] [nvarchar](50) NULL,
	[approvalDate] [date] NULL,
 CONSTRAINT [PK_Adjustment Voucher Record] PRIMARY KEY CLUSTERED 
(
	[voucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Category]    Script Date: 14/1/2018 6:56:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[categoryID] [int] NOT NULL,
	[categoryName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[categoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Collection Point]    Script Date: 14/1/2018 6:56:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Collection Point](
	[collectionPointID] [int] NOT NULL,
	[collectionPointName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Collection Point] PRIMARY KEY CLUSTERED 
(
	[collectionPointID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Department]    Script Date: 14/1/2018 6:56:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[departmentCode] [nvarchar](50) NOT NULL,
	[departmentName] [nvarchar](50) NOT NULL,
	[contactName] [nvarchar](50) NOT NULL,
	[phoneNo] [int] NOT NULL,
	[faxNo] [int] NOT NULL,
	[departmentHeadID] [nvarchar](50) NOT NULL,
	[collectionPointID] [int] NOT NULL,
	[representativeID] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[departmentCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Inventory Status Record]    Script Date: 14/1/2018 6:56:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inventory Status Record](
	[itemCode] [nvarchar](50) NOT NULL,
	[date] [date] NOT NULL,
	[onHandQty] [int] NOT NULL,
	[discrepancyQty] [int] NOT NULL,
	[remarks] [nvarchar](100) NULL,
 CONSTRAINT [PK_Inventory Status Record] PRIMARY KEY CLUSTERED 
(
	[itemCode] ASC,
	[date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Purchase Details]    Script Date: 14/1/2018 6:56:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Purchase Details](
	[orderNo] [int] NOT NULL,
	[itemCode] [nvarchar](50) NOT NULL,
	[remarks] [nvarchar](100) NULL,
	[qty] [int] NOT NULL,
	[fulfilledQty] [int] NULL,
	[price] [decimal](18, 2) NOT NULL,
	[deliveryOrderNo] [int] NULL,
 CONSTRAINT [PK_Purchase Details] PRIMARY KEY CLUSTERED 
(
	[orderNo] ASC,
	[itemCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Purchase Order Record]    Script Date: 14/1/2018 6:56:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Purchase Order Record](
	[orderNo] [int] NOT NULL,
	[supplierCode] [nvarchar](50) NOT NULL,
	[date] [date] NOT NULL,
	[clerkID] [nvarchar](50) NOT NULL,
	[status] [nvarchar](50) NOT NULL,
	[expectedDeliveryDate] [date] NOT NULL,
 CONSTRAINT [PK_Purchase Order] PRIMARY KEY CLUSTERED 
(
	[orderNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Requisition Details]    Script Date: 14/1/2018 6:56:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Requisition Details](
	[requisitionNo] [int] NOT NULL,
	[itemCode] [nvarchar](50) NOT NULL,
	[remarks] [nvarchar](100) NULL,
	[qty] [int] NOT NULL,
	[fulfilledQty] [int] NULL,
	[clerkID] [nvarchar](50) NULL,
	[retrievedDate] [date] NULL,
	[allocatedQty] [int] NULL,
	[nextCollectionDate] [date] NULL,
 CONSTRAINT [PK_Requisition Details] PRIMARY KEY CLUSTERED 
(
	[requisitionNo] ASC,
	[itemCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Requisition Record]    Script Date: 14/1/2018 6:56:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Requisition Record](
	[requisitionNo] [int] NOT NULL,
	[deptCode] [nvarchar](50) NOT NULL,
	[requesterID] [nvarchar](50) NOT NULL,
	[approvingStaffID] [nvarchar](50) NULL,
	[approveDate] [date] NULL,
	[status] [nvarchar](50) NOT NULL,
	[requestDate] [date] NOT NULL,
 CONSTRAINT [PK_Requisition Record] PRIMARY KEY CLUSTERED 
(
	[requisitionNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Stationery]    Script Date: 14/1/2018 6:56:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stationery](
	[itemCode] [nvarchar](50) NOT NULL,
	[categoryID] [int] NOT NULL,
	[description] [nvarchar](50) NOT NULL,
	[reorderLevel] [int] NOT NULL,
	[reorderQty] [int] NOT NULL,
	[unitOfMeasure] [nvarchar](50) NOT NULL,
	[stockQty] [int] NOT NULL,
	[location] [nvarchar](50) NOT NULL,
	[firstSupplierCode] [nvarchar](50) NOT NULL,
	[secondSupplierCode] [nvarchar](50) NULL,
	[thirdSupplierCode] [nvarchar](50) NULL,
	[price] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_Stationery] PRIMARY KEY CLUSTERED 
(
	[itemCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 14/1/2018 6:56:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier](
	[supplierCode] [nvarchar](50) NOT NULL,
	[GSTNo] [int] NOT NULL,
	[supplierName] [nvarchar](50) NOT NULL,
	[contactName] [nvarchar](50) NOT NULL,
	[phoneNo] [int] NOT NULL,
	[faxNo] [int] NULL,
	[address] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Supplier] PRIMARY KEY CLUSTERED 
(
	[supplierCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Transaction Details]    Script Date: 14/1/2018 6:56:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transaction Details](
	[transactionNo] [int] NOT NULL,
	[itemCode] [nvarchar](50) NOT NULL,
	[adjustedQty] [int] NOT NULL,
	[balanceQty] [int] NOT NULL,
	[remarks] [nvarchar](100) NULL,
 CONSTRAINT [PK_Transaction Details] PRIMARY KEY CLUSTERED 
(
	[transactionNo] ASC,
	[itemCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Transaction Record]    Script Date: 14/1/2018 6:56:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transaction Record](
	[transactionNo] [int] NOT NULL,
	[clerkID] [nvarchar](50) NULL,
	[date] [date] NULL,
	[type] [nvarchar](50) NULL,
 CONSTRAINT [PK_Transaction Record] PRIMARY KEY CLUSTERED 
(
	[transactionNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 14/1/2018 6:56:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[userID] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[contactNo] [int] NOT NULL,
	[address] [nvarchar](50) NOT NULL,
	[role] [nvarchar](50) NOT NULL,
	[departmentCode] [nvarchar](50) NOT NULL,
	[userEmail] [nvarchar](50) NOT NULL,
	[delegationStart] [date] NULL,
	[delegationEnd] [date] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Voucher Details]    Script Date: 14/1/2018 6:56:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Voucher Details](
	[voucherID] [int] NOT NULL,
	[itemCode] [nvarchar](50) NOT NULL,
	[adjustedQty] [int] NOT NULL,
	[remarks] [nvarchar](100) NULL,
 CONSTRAINT [PK_Voucher Details] PRIMARY KEY CLUSTERED 
(
	[voucherID] ASC,
	[itemCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Adjustment Voucher Record]  WITH CHECK ADD  CONSTRAINT [FK_Adjustment Voucher Record_User] FOREIGN KEY([handlingStaffID])
REFERENCES [dbo].[User] ([userID])
GO
ALTER TABLE [dbo].[Adjustment Voucher Record] CHECK CONSTRAINT [FK_Adjustment Voucher Record_User]
GO
ALTER TABLE [dbo].[Adjustment Voucher Record]  WITH CHECK ADD  CONSTRAINT [FK_Adjustment Voucher Record_User1] FOREIGN KEY([authorisingStaffID])
REFERENCES [dbo].[User] ([userID])
GO
ALTER TABLE [dbo].[Adjustment Voucher Record] CHECK CONSTRAINT [FK_Adjustment Voucher Record_User1]
GO
ALTER TABLE [dbo].[Department]  WITH CHECK ADD  CONSTRAINT [FK_Department_Collection Point] FOREIGN KEY([collectionPointID])
REFERENCES [dbo].[Collection Point] ([collectionPointID])
GO
ALTER TABLE [dbo].[Department] CHECK CONSTRAINT [FK_Department_Collection Point]
GO
ALTER TABLE [dbo].[Department]  WITH CHECK ADD  CONSTRAINT [FK_Department_User] FOREIGN KEY([departmentHeadID])
REFERENCES [dbo].[User] ([userID])
GO
ALTER TABLE [dbo].[Department] CHECK CONSTRAINT [FK_Department_User]
GO
ALTER TABLE [dbo].[Department]  WITH CHECK ADD  CONSTRAINT [FK_Department_User1] FOREIGN KEY([representativeID])
REFERENCES [dbo].[User] ([userID])
GO
ALTER TABLE [dbo].[Department] CHECK CONSTRAINT [FK_Department_User1]
GO
ALTER TABLE [dbo].[Inventory Status Record]  WITH CHECK ADD  CONSTRAINT [FK_Inventory Status Record_Stationery] FOREIGN KEY([itemCode])
REFERENCES [dbo].[Stationery] ([itemCode])
GO
ALTER TABLE [dbo].[Inventory Status Record] CHECK CONSTRAINT [FK_Inventory Status Record_Stationery]
GO
ALTER TABLE [dbo].[Purchase Details]  WITH CHECK ADD  CONSTRAINT [FK_Purchase Details_Purchase Order Record] FOREIGN KEY([orderNo])
REFERENCES [dbo].[Purchase Order Record] ([orderNo])
GO
ALTER TABLE [dbo].[Purchase Details] CHECK CONSTRAINT [FK_Purchase Details_Purchase Order Record]
GO
ALTER TABLE [dbo].[Purchase Details]  WITH CHECK ADD  CONSTRAINT [FK_Purchase Details_Stationery] FOREIGN KEY([itemCode])
REFERENCES [dbo].[Stationery] ([itemCode])
GO
ALTER TABLE [dbo].[Purchase Details] CHECK CONSTRAINT [FK_Purchase Details_Stationery]
GO
ALTER TABLE [dbo].[Purchase Order Record]  WITH CHECK ADD  CONSTRAINT [FK_Purchase Order_User] FOREIGN KEY([clerkID])
REFERENCES [dbo].[User] ([userID])
GO
ALTER TABLE [dbo].[Purchase Order Record] CHECK CONSTRAINT [FK_Purchase Order_User]
GO
ALTER TABLE [dbo].[Requisition Details]  WITH CHECK ADD  CONSTRAINT [FK_Requisition Details_Requisition Record] FOREIGN KEY([requisitionNo])
REFERENCES [dbo].[Requisition Record] ([requisitionNo])
GO
ALTER TABLE [dbo].[Requisition Details] CHECK CONSTRAINT [FK_Requisition Details_Requisition Record]
GO
ALTER TABLE [dbo].[Requisition Details]  WITH CHECK ADD  CONSTRAINT [FK_Requisition Details_Stationery] FOREIGN KEY([itemCode])
REFERENCES [dbo].[Stationery] ([itemCode])
GO
ALTER TABLE [dbo].[Requisition Details] CHECK CONSTRAINT [FK_Requisition Details_Stationery]
GO
ALTER TABLE [dbo].[Requisition Record]  WITH CHECK ADD  CONSTRAINT [FK_Requisition Record_Department] FOREIGN KEY([deptCode])
REFERENCES [dbo].[Department] ([departmentCode])
GO
ALTER TABLE [dbo].[Requisition Record] CHECK CONSTRAINT [FK_Requisition Record_Department]
GO
ALTER TABLE [dbo].[Requisition Record]  WITH CHECK ADD  CONSTRAINT [FK_Requisition Record_User] FOREIGN KEY([requesterID])
REFERENCES [dbo].[User] ([userID])
GO
ALTER TABLE [dbo].[Requisition Record] CHECK CONSTRAINT [FK_Requisition Record_User]
GO
ALTER TABLE [dbo].[Requisition Record]  WITH CHECK ADD  CONSTRAINT [FK_Requisition Record_User1] FOREIGN KEY([approvingStaffID])
REFERENCES [dbo].[User] ([userID])
GO
ALTER TABLE [dbo].[Requisition Record] CHECK CONSTRAINT [FK_Requisition Record_User1]
GO
ALTER TABLE [dbo].[Stationery]  WITH CHECK ADD  CONSTRAINT [FK_Stationery_Category] FOREIGN KEY([categoryID])
REFERENCES [dbo].[Category] ([categoryID])
GO
ALTER TABLE [dbo].[Stationery] CHECK CONSTRAINT [FK_Stationery_Category]
GO
ALTER TABLE [dbo].[Stationery]  WITH CHECK ADD  CONSTRAINT [FK_Stationery_Supplier] FOREIGN KEY([firstSupplierCode])
REFERENCES [dbo].[Supplier] ([supplierCode])
GO
ALTER TABLE [dbo].[Stationery] CHECK CONSTRAINT [FK_Stationery_Supplier]
GO
ALTER TABLE [dbo].[Stationery]  WITH CHECK ADD  CONSTRAINT [FK_Stationery_Supplier1] FOREIGN KEY([secondSupplierCode])
REFERENCES [dbo].[Supplier] ([supplierCode])
GO
ALTER TABLE [dbo].[Stationery] CHECK CONSTRAINT [FK_Stationery_Supplier1]
GO
ALTER TABLE [dbo].[Stationery]  WITH CHECK ADD  CONSTRAINT [FK_Stationery_Supplier2] FOREIGN KEY([thirdSupplierCode])
REFERENCES [dbo].[Supplier] ([supplierCode])
GO
ALTER TABLE [dbo].[Stationery] CHECK CONSTRAINT [FK_Stationery_Supplier2]
GO
ALTER TABLE [dbo].[Transaction Details]  WITH CHECK ADD  CONSTRAINT [FK_Transaction Details_Stationery] FOREIGN KEY([itemCode])
REFERENCES [dbo].[Stationery] ([itemCode])
GO
ALTER TABLE [dbo].[Transaction Details] CHECK CONSTRAINT [FK_Transaction Details_Stationery]
GO
ALTER TABLE [dbo].[Transaction Details]  WITH CHECK ADD  CONSTRAINT [FK_Transaction Details_Transaction Record] FOREIGN KEY([transactionNo])
REFERENCES [dbo].[Transaction Record] ([transactionNo])
GO
ALTER TABLE [dbo].[Transaction Details] CHECK CONSTRAINT [FK_Transaction Details_Transaction Record]
GO
ALTER TABLE [dbo].[Transaction Record]  WITH CHECK ADD  CONSTRAINT [FK_Transaction Record_User] FOREIGN KEY([clerkID])
REFERENCES [dbo].[User] ([userID])
GO
ALTER TABLE [dbo].[Transaction Record] CHECK CONSTRAINT [FK_Transaction Record_User]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Department] FOREIGN KEY([departmentCode])
REFERENCES [dbo].[Department] ([departmentCode])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Department]
GO
ALTER TABLE [dbo].[Voucher Details]  WITH CHECK ADD  CONSTRAINT [FK_Voucher Details_Adjustment Voucher Record] FOREIGN KEY([voucherID])
REFERENCES [dbo].[Adjustment Voucher Record] ([voucherID])
GO
ALTER TABLE [dbo].[Voucher Details] CHECK CONSTRAINT [FK_Voucher Details_Adjustment Voucher Record]
GO
ALTER TABLE [dbo].[Voucher Details]  WITH CHECK ADD  CONSTRAINT [FK_Voucher Details_Stationery] FOREIGN KEY([itemCode])
REFERENCES [dbo].[Stationery] ([itemCode])
GO
ALTER TABLE [dbo].[Voucher Details] CHECK CONSTRAINT [FK_Voucher Details_Stationery]
GO
USE [master]
GO
ALTER DATABASE [ADproject] SET  READ_WRITE 
GO
