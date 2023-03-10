USE [master]
GO
/****** Object:  Database [DB_Hospital]    Script Date: 27/05/2021 05:14:41 م ******/
CREATE DATABASE [DB_Hospital]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DB_Hospital', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\DB_Hospital.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DB_Hospital_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\DB_Hospital_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [DB_Hospital] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DB_Hospital].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DB_Hospital] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DB_Hospital] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DB_Hospital] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DB_Hospital] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DB_Hospital] SET ARITHABORT OFF 
GO
ALTER DATABASE [DB_Hospital] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DB_Hospital] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DB_Hospital] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DB_Hospital] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DB_Hospital] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DB_Hospital] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DB_Hospital] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DB_Hospital] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DB_Hospital] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DB_Hospital] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DB_Hospital] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DB_Hospital] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DB_Hospital] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DB_Hospital] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DB_Hospital] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DB_Hospital] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DB_Hospital] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DB_Hospital] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DB_Hospital] SET  MULTI_USER 
GO
ALTER DATABASE [DB_Hospital] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DB_Hospital] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DB_Hospital] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DB_Hospital] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DB_Hospital] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DB_Hospital] SET QUERY_STORE = OFF
GO
USE [DB_Hospital]
GO
/****** Object:  Table [dbo].[appointment]    Script Date: 27/05/2021 05:14:41 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[appointment](
	[appointment_id] [int] NOT NULL,
	[start_dt_time] [datetime] NULL,
	[end_dt_time] [datetime] NULL,
	[room_id] [int] NULL,
	[Patient_id] [int] NULL,
	[doctor_id] [int] NULL,
 CONSTRAINT [PK_appointment] PRIMARY KEY CLUSTERED 
(
	[appointment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bill]    Script Date: 27/05/2021 05:14:41 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bill](
	[bill_id] [int] NULL,
	[date] [datetime] NULL,
	[amount] [decimal](18, 0) NULL,
	[Status] [nvarchar](50) NULL,
	[Patient_id] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 27/05/2021 05:14:41 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[Dept_id] [int] NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Head] [nvarchar](50) NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[Dept_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Doctor]    Script Date: 27/05/2021 05:14:41 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doctor](
	[doctor_id] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Gender] [nvarchar](50) NULL,
	[DOB] [datetime] NULL,
	[Phone] [int] NULL,
	[Specialist] [nvarchar](50) NULL,
	[Dept_id] [int] NULL,
	[Employee_id] [int] NULL,
 CONSTRAINT [PK_Doctor] PRIMARY KEY CLUSTERED 
(
	[doctor_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 27/05/2021 05:14:41 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[Employee_id] [int] NOT NULL,
	[Employee_Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[Employee_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[medication]    Script Date: 27/05/2021 05:14:41 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[medication](
	[medication_id] [int] NULL,
	[Name] [nvarchar](50) NULL,
	[description] [nvarchar](max) NOT NULL,
	[Price] [decimal](18, 0) NULL,
	[Patient_id] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Patient]    Script Date: 27/05/2021 05:14:41 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patient](
	[Patient_id] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](50) NULL,
	[Phone] [int] NULL,
	[Insurance num] [int] NULL,
	[doctor_id] [int] NULL,
	[room_id] [int] NULL,
 CONSTRAINT [PK_Patient] PRIMARY KEY CLUSTERED 
(
	[Patient_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Room]    Script Date: 27/05/2021 05:14:41 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room](
	[room_id] [int] NOT NULL,
	[Floor_number] [int] NULL,
	[room_type] [nvarchar](50) NULL,
	[description] [nvarchar](max) NULL,
	[available] [nvarchar](50) NULL,
 CONSTRAINT [PK_Room] PRIMARY KEY CLUSTERED 
(
	[room_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[appointment] ([appointment_id], [start_dt_time], [end_dt_time], [room_id], [Patient_id], [doctor_id]) VALUES (4684658, CAST(N'2021-11-15T10:00:00.000' AS DateTime), CAST(N'2021-11-15T12:00:00.000' AS DateTime), 107, 1, 1)
INSERT [dbo].[appointment] ([appointment_id], [start_dt_time], [end_dt_time], [room_id], [Patient_id], [doctor_id]) VALUES (13216584, CAST(N'2008-04-24T10:00:00.000' AS DateTime), CAST(N'2008-04-24T11:00:00.000' AS DateTime), 102, 2, 2)
INSERT [dbo].[appointment] ([appointment_id], [start_dt_time], [end_dt_time], [room_id], [Patient_id], [doctor_id]) VALUES (26548913, CAST(N'2018-03-12T10:00:00.000' AS DateTime), CAST(N'2018-03-12T11:00:00.000' AS DateTime), 103, 5, 3)
INSERT [dbo].[appointment] ([appointment_id], [start_dt_time], [end_dt_time], [room_id], [Patient_id], [doctor_id]) VALUES (36549879, CAST(N'2020-07-15T10:00:00.000' AS DateTime), CAST(N'2020-07-15T11:00:00.000' AS DateTime), 104, 2, 5)
GO
INSERT [dbo].[Bill] ([bill_id], [date], [amount], [Status], [Patient_id]) VALUES (1, CAST(N'2012-01-20T00:00:00.000' AS DateTime), CAST(201 AS Decimal(18, 0)), N'Paid', 3)
INSERT [dbo].[Bill] ([bill_id], [date], [amount], [Status], [Patient_id]) VALUES (2, CAST(N'2020-07-15T00:00:00.000' AS DateTime), CAST(300 AS Decimal(18, 0)), N'Paid', 4)
INSERT [dbo].[Bill] ([bill_id], [date], [amount], [Status], [Patient_id]) VALUES (3, CAST(N'2021-02-02T00:00:00.000' AS DateTime), CAST(400 AS Decimal(18, 0)), N'Not Paid', 1)
INSERT [dbo].[Bill] ([bill_id], [date], [amount], [Status], [Patient_id]) VALUES (4, CAST(N'2021-04-14T00:00:00.000' AS DateTime), CAST(90 AS Decimal(18, 0)), N'Not Paid', 2)
INSERT [dbo].[Bill] ([bill_id], [date], [amount], [Status], [Patient_id]) VALUES (5, CAST(N'2021-05-14T00:00:00.000' AS DateTime), CAST(2000 AS Decimal(18, 0)), N'Paid', 5)
GO
INSERT [dbo].[Department] ([Dept_id], [Name], [Head]) VALUES (1, N'General Medicine', N'Percival Cox  ')
INSERT [dbo].[Department] ([Dept_id], [Name], [Head]) VALUES (2, N'Surgery          ', N'John Wen')
INSERT [dbo].[Department] ([Dept_id], [Name], [Head]) VALUES (3, N'Psychiatry       ', N'Molly Clock ')
INSERT [dbo].[Department] ([Dept_id], [Name], [Head]) VALUES (4, N'Dentistry', N'Ali Ahmed')
GO
INSERT [dbo].[Doctor] ([doctor_id], [Name], [Gender], [DOB], [Phone], [Specialist], [Dept_id], [Employee_id]) VALUES (1, N'John Dorian ', N'Male', CAST(N'1992-04-24T10:00:00.000' AS DateTime), 59264853, N'Senior General Doctor', 1, 1)
INSERT [dbo].[Doctor] ([doctor_id], [Name], [Gender], [DOB], [Phone], [Specialist], [Dept_id], [Employee_id]) VALUES (2, N'Percival Cox', N'Male', CAST(N'1994-04-26T10:00:00.000' AS DateTime), 5925486, N'Pediatrician', 1, 2)
INSERT [dbo].[Doctor] ([doctor_id], [Name], [Gender], [DOB], [Phone], [Specialist], [Dept_id], [Employee_id]) VALUES (3, N'Molly Clock ', N'Female', CAST(N'1990-06-27T10:00:00.000' AS DateTime), 5786162, N'psychiatrist', 3, 3)
INSERT [dbo].[Doctor] ([doctor_id], [Name], [Gender], [DOB], [Phone], [Specialist], [Dept_id], [Employee_id]) VALUES (4, N'Bob Kelso', N'Male', CAST(N'1989-04-27T11:00:00.000' AS DateTime), 5486355, N'General Surgery', 2, 4)
INSERT [dbo].[Doctor] ([doctor_id], [Name], [Gender], [DOB], [Phone], [Specialist], [Dept_id], [Employee_id]) VALUES (5, N'Amal Omar', N'Female', CAST(N'1997-08-01T11:00:00.000' AS DateTime), 5935654, N'Orthopaedic Surgery', 2, 5)
INSERT [dbo].[Doctor] ([doctor_id], [Name], [Gender], [DOB], [Phone], [Specialist], [Dept_id], [Employee_id]) VALUES (6, N'Doaa Shaheen', N'Female', CAST(N'1999-01-27T11:00:00.000' AS DateTime), 597853, N'Dentistry', 4, 6)
GO
INSERT [dbo].[Employee] ([Employee_id], [Employee_Name]) VALUES (1, N'John Dorian ')
INSERT [dbo].[Employee] ([Employee_id], [Employee_Name]) VALUES (2, N'Percival Cox')
INSERT [dbo].[Employee] ([Employee_id], [Employee_Name]) VALUES (3, N'Molly Clock ')
INSERT [dbo].[Employee] ([Employee_id], [Employee_Name]) VALUES (4, N'Bob Kelso')
INSERT [dbo].[Employee] ([Employee_id], [Employee_Name]) VALUES (5, N'Amal Omar')
INSERT [dbo].[Employee] ([Employee_id], [Employee_Name]) VALUES (6, N'Doaa Shaheen')
GO
INSERT [dbo].[medication] ([medication_id], [Name], [description], [Price], [Patient_id]) VALUES (123, N'Aspirin', N'Anti-inflammatory', CAST(250 AS Decimal(18, 0)), 2)
INSERT [dbo].[medication] ([medication_id], [Name], [description], [Price], [Patient_id]) VALUES (456, N'Diclofenac', N'Residence', CAST(100 AS Decimal(18, 0)), 1)
INSERT [dbo].[medication] ([medication_id], [Name], [description], [Price], [Patient_id]) VALUES (789, N'Pregabalin', N'Neurology', CAST(300 AS Decimal(18, 0)), 5)
INSERT [dbo].[medication] ([medication_id], [Name], [description], [Price], [Patient_id]) VALUES (102, N'Paracetamol', N'Dental antibiotic', CAST(150 AS Decimal(18, 0)), 3)
INSERT [dbo].[medication] ([medication_id], [Name], [description], [Price], [Patient_id]) VALUES (201, N'Mirtazapine', N'Antidepressant', CAST(70 AS Decimal(18, 0)), 3)
GO
INSERT [dbo].[Patient] ([Patient_id], [Name], [Address], [Phone], [Insurance num], [doctor_id], [room_id]) VALUES (1, N'John Smith   ', N' 42 Foobar Lane', 5550256, 68476213, 1, 107)
INSERT [dbo].[Patient] ([Patient_id], [Name], [Address], [Phone], [Insurance num], [doctor_id], [room_id]) VALUES (2, N'Grace Ritchie ', N' 37 Snafu Drive', 5550512, 36546321, 2, 104)
INSERT [dbo].[Patient] ([Patient_id], [Name], [Address], [Phone], [Insurance num], [doctor_id], [room_id]) VALUES (3, N'Random J. Patient', N'101 Omgbbq Street', 5551204, 65465421, 4, 106)
INSERT [dbo].[Patient] ([Patient_id], [Name], [Address], [Phone], [Insurance num], [doctor_id], [room_id]) VALUES (4, N' Dennis Doe ', N'1100 Foobaz Avenue', 5552048, 68421879, 6, 101)
INSERT [dbo].[Patient] ([Patient_id], [Name], [Address], [Phone], [Insurance num], [doctor_id], [room_id]) VALUES (5, N'Eman Sh', N'50 Foobar Lane', 5552001, 68421458, 3, 103)
INSERT [dbo].[Patient] ([Patient_id], [Name], [Address], [Phone], [Insurance num], [doctor_id], [room_id]) VALUES (6, N'Ali John', N'Gaza', 5556478, 68421558, 1, 102)
GO
INSERT [dbo].[Room] ([room_id], [Floor_number], [room_type], [description], [available]) VALUES (101, 2, N'Single', N'Dentistry Room', N'yes')
INSERT [dbo].[Room] ([room_id], [Floor_number], [room_type], [description], [available]) VALUES (102, 2, N'Single', N'Restroom', N'yes')
INSERT [dbo].[Room] ([room_id], [Floor_number], [room_type], [description], [available]) VALUES (103, 3, N'Single', N'Women''s Room', N'No')
INSERT [dbo].[Room] ([room_id], [Floor_number], [room_type], [description], [available]) VALUES (104, 3, N'Common ', N'Women''s Room', N'yes')
INSERT [dbo].[Room] ([room_id], [Floor_number], [room_type], [description], [available]) VALUES (105, 1, N'Common ', N'Reception Room', N'yes')
INSERT [dbo].[Room] ([room_id], [Floor_number], [room_type], [description], [available]) VALUES (106, 1, N'Single', N'Preview Room 2', N'No')
INSERT [dbo].[Room] ([room_id], [Floor_number], [room_type], [description], [available]) VALUES (107, 4, N'Single', N'Preview Room 1', N'yes')
GO
ALTER TABLE [dbo].[appointment]  WITH CHECK ADD  CONSTRAINT [FK_appointment_Doctor] FOREIGN KEY([doctor_id])
REFERENCES [dbo].[Doctor] ([doctor_id])
GO
ALTER TABLE [dbo].[appointment] CHECK CONSTRAINT [FK_appointment_Doctor]
GO
ALTER TABLE [dbo].[appointment]  WITH CHECK ADD  CONSTRAINT [FK_appointment_Patient] FOREIGN KEY([Patient_id])
REFERENCES [dbo].[Patient] ([Patient_id])
GO
ALTER TABLE [dbo].[appointment] CHECK CONSTRAINT [FK_appointment_Patient]
GO
ALTER TABLE [dbo].[appointment]  WITH CHECK ADD  CONSTRAINT [FK_appointment_Room] FOREIGN KEY([room_id])
REFERENCES [dbo].[Room] ([room_id])
GO
ALTER TABLE [dbo].[appointment] CHECK CONSTRAINT [FK_appointment_Room]
GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD  CONSTRAINT [FK_Bill_Patient] FOREIGN KEY([Patient_id])
REFERENCES [dbo].[Patient] ([Patient_id])
GO
ALTER TABLE [dbo].[Bill] CHECK CONSTRAINT [FK_Bill_Patient]
GO
ALTER TABLE [dbo].[Doctor]  WITH CHECK ADD FOREIGN KEY([Employee_id])
REFERENCES [dbo].[Employee] ([Employee_id])
GO
ALTER TABLE [dbo].[Doctor]  WITH CHECK ADD  CONSTRAINT [FK_Doctor_Department] FOREIGN KEY([Dept_id])
REFERENCES [dbo].[Department] ([Dept_id])
GO
ALTER TABLE [dbo].[Doctor] CHECK CONSTRAINT [FK_Doctor_Department]
GO
ALTER TABLE [dbo].[medication]  WITH CHECK ADD  CONSTRAINT [FK_medication_Patient] FOREIGN KEY([Patient_id])
REFERENCES [dbo].[Patient] ([Patient_id])
GO
ALTER TABLE [dbo].[medication] CHECK CONSTRAINT [FK_medication_Patient]
GO
ALTER TABLE [dbo].[Patient]  WITH CHECK ADD  CONSTRAINT [FK_Patient_Doctor] FOREIGN KEY([doctor_id])
REFERENCES [dbo].[Doctor] ([doctor_id])
GO
ALTER TABLE [dbo].[Patient] CHECK CONSTRAINT [FK_Patient_Doctor]
GO
ALTER TABLE [dbo].[Patient]  WITH CHECK ADD  CONSTRAINT [FK_Patient_Room] FOREIGN KEY([room_id])
REFERENCES [dbo].[Room] ([room_id])
GO
ALTER TABLE [dbo].[Patient] CHECK CONSTRAINT [FK_Patient_Room]
GO
USE [master]
GO
ALTER DATABASE [DB_Hospital] SET  READ_WRITE 
GO
