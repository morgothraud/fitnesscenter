USE [master]
GO
/****** Object:  Database [FitnessCenter]    Script Date: 8.12.2015 19:43:01 ******/
CREATE DATABASE [FitnessCenter]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FitnessCenter', FILENAME = N'D:\Program Files\SQL\MSSQL12.MSSQLSERVER\MSSQL\DATA\FitnessCenter.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'FitnessCenter_log', FILENAME = N'D:\Program Files\SQL\MSSQL12.MSSQLSERVER\MSSQL\DATA\FitnessCenter_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [FitnessCenter] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FitnessCenter].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FitnessCenter] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FitnessCenter] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FitnessCenter] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FitnessCenter] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FitnessCenter] SET ARITHABORT OFF 
GO
ALTER DATABASE [FitnessCenter] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FitnessCenter] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FitnessCenter] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FitnessCenter] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FitnessCenter] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FitnessCenter] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FitnessCenter] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FitnessCenter] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FitnessCenter] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FitnessCenter] SET  DISABLE_BROKER 
GO
ALTER DATABASE [FitnessCenter] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FitnessCenter] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FitnessCenter] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FitnessCenter] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FitnessCenter] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FitnessCenter] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FitnessCenter] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FitnessCenter] SET RECOVERY FULL 
GO
ALTER DATABASE [FitnessCenter] SET  MULTI_USER 
GO
ALTER DATABASE [FitnessCenter] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FitnessCenter] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FitnessCenter] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FitnessCenter] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [FitnessCenter] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'FitnessCenter', N'ON'
GO
USE [FitnessCenter]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 8.12.2015 19:43:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[RegistrationDate] [datetime] NULL,
	[CreditCardNumber] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[EMail] [nvarchar](50) NULL,
	[Gender] [bit] NULL,
	[Password] [nvarchar](50) NULL,
	[BirthDate] [date] NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Equipment]    Script Date: 8.12.2015 19:43:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Equipment](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Quantity] [int] NULL,
	[IsAvaliable] [bit] NULL,
	[UnitPrice] [int] NULL,
 CONSTRAINT [PK_Equipment] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Manager]    Script Date: 8.12.2015 19:43:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manager](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[BirthDate] [date] NULL,
	[Address] [nvarchar](50) NULL,
	[City] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[EMail] [nvarchar](50) NULL,
	[Gender] [bit] NULL,
	[Salary] [decimal](18, 0) NULL,
	[Password] [nvarchar](50) NULL,
 CONSTRAINT [PK_Manager] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PassReset]    Script Date: 8.12.2015 19:43:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PassReset](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[EMail] [nvarchar](50) NULL,
	[AutID] [nvarchar](300) NULL,
	[isAvaliable] [bit] NULL,
	[oldPass] [nvarchar](50) NULL,
 CONSTRAINT [PK_PassReset] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Report]    Script Date: 8.12.2015 19:43:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Report](
	[SenderID] [int] NOT NULL,
	[ReceiverID] [int] NOT NULL,
	[Subject] [nvarchar](50) NULL,
	[Body] [nvarchar](50) NULL,
	[SendDate] [datetime] NULL,
 CONSTRAINT [PK_Report] PRIMARY KEY CLUSTERED 
(
	[SenderID] ASC,
	[ReceiverID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Staff]    Script Date: 8.12.2015 19:43:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staff](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[Title] [nvarchar](50) NULL,
	[BirthDate] [date] NULL,
	[Address] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[EMail] [nvarchar](50) NULL,
	[Gender] [bit] NULL,
	[HireDate] [date] NULL,
	[Salary] [decimal](18, 0) NULL,
	[Password] [nvarchar](50) NULL,
 CONSTRAINT [PK_Staff] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Trainer]    Script Date: 8.12.2015 19:43:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Trainer](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[EMail] [nvarchar](50) NULL,
	[BirthDate] [date] NULL,
	[Gender] [bit] NULL,
	[HireDate] [datetime] NULL,
	[Salary] [decimal](18, 0) NULL,
	[Password] [nvarchar](50) NULL,
 CONSTRAINT [PK_Trainer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TrainerSchedule]    Script Date: 8.12.2015 19:43:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TrainerSchedule](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TrainerID] [int] NOT NULL,
	[Time] [smalldatetime] NULL,
	[Type] [nvarchar](50) NULL,
 CONSTRAINT [PK_TrainerSchedule_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 8.12.2015 19:43:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[EMail] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[Role] [nvarchar](50) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[WorkoutProgram]    Script Date: 8.12.2015 19:43:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkoutProgram](
	[ID] [int] NOT NULL,
	[TrainerID] [int] NOT NULL,
	[CustomerID] [int] NOT NULL,
	[Schedule] [nvarchar](50) NULL,
 CONSTRAINT [PK_WorkoutProgram] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[TrainerID] ASC,
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[PassReset]  WITH CHECK ADD  CONSTRAINT [FK_PassReset_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[PassReset] CHECK CONSTRAINT [FK_PassReset_User]
GO
ALTER TABLE [dbo].[PassReset]  WITH CHECK ADD  CONSTRAINT [FK_PassReset_User1] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[PassReset] CHECK CONSTRAINT [FK_PassReset_User1]
GO
ALTER TABLE [dbo].[Report]  WITH CHECK ADD  CONSTRAINT [FK_Report_User] FOREIGN KEY([SenderID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Report] CHECK CONSTRAINT [FK_Report_User]
GO
ALTER TABLE [dbo].[Report]  WITH CHECK ADD  CONSTRAINT [FK_Report_User1] FOREIGN KEY([ReceiverID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Report] CHECK CONSTRAINT [FK_Report_User1]
GO
ALTER TABLE [dbo].[TrainerSchedule]  WITH CHECK ADD  CONSTRAINT [FK_TrainerSchedule_Trainer] FOREIGN KEY([TrainerID])
REFERENCES [dbo].[Trainer] ([ID])
GO
ALTER TABLE [dbo].[TrainerSchedule] CHECK CONSTRAINT [FK_TrainerSchedule_Trainer]
GO
ALTER TABLE [dbo].[WorkoutProgram]  WITH CHECK ADD  CONSTRAINT [FK_WorkoutProgram_Customer] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([ID])
GO
ALTER TABLE [dbo].[WorkoutProgram] CHECK CONSTRAINT [FK_WorkoutProgram_Customer]
GO
ALTER TABLE [dbo].[WorkoutProgram]  WITH CHECK ADD  CONSTRAINT [FK_WorkoutProgram_Trainer] FOREIGN KEY([TrainerID])
REFERENCES [dbo].[Trainer] ([ID])
GO
ALTER TABLE [dbo].[WorkoutProgram] CHECK CONSTRAINT [FK_WorkoutProgram_Trainer]
GO
USE [master]
GO
ALTER DATABASE [FitnessCenter] SET  READ_WRITE 
GO
