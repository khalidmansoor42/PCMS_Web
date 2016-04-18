USE [master]
GO
/****** Object:  Database [doctor]    Script Date: 4/12/2016 12:40:46 PM ******/
CREATE DATABASE [doctor]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'doctor', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\doctor.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'doctor_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\doctor_log.ldf' , SIZE = 3456KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [doctor] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [doctor].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [doctor] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [doctor] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [doctor] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [doctor] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [doctor] SET ARITHABORT OFF 
GO
ALTER DATABASE [doctor] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [doctor] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [doctor] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [doctor] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [doctor] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [doctor] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [doctor] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [doctor] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [doctor] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [doctor] SET  DISABLE_BROKER 
GO
ALTER DATABASE [doctor] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [doctor] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [doctor] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [doctor] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [doctor] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [doctor] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [doctor] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [doctor] SET RECOVERY FULL 
GO
ALTER DATABASE [doctor] SET  MULTI_USER 
GO
ALTER DATABASE [doctor] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [doctor] SET DB_CHAINING OFF 
GO
ALTER DATABASE [doctor] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [doctor] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [doctor] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'doctor', N'ON'
GO
USE [doctor]
GO
/****** Object:  User [husnain]    Script Date: 4/12/2016 12:40:46 PM ******/
CREATE USER [husnain] FOR LOGIN [husnain] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[address]    Script Date: 4/12/2016 12:40:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[address](
	[mob1] [varchar](50) NULL,
	[mob2] [varchar](50) NULL,
	[email] [varchar](50) NULL,
	[address] [varchar](50) NULL,
	[image] [varchar](255) NULL,
	[id] [int] NULL,
	[mob3] [varchar](50) NULL,
	[specialization] [varchar](255) NULL,
	[summary] [varchar](255) NULL,
	[name] [varchar](50) NULL,
	[header] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[header] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[attendantRelation]    Script Date: 4/12/2016 12:40:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[attendantRelation](
	[relation_name] [varchar](150) NULL,
	[relation_id] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[relation_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[city]    Script Date: 4/12/2016 12:40:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[city](
	[city_name] [varchar](150) NULL,
	[city_id] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[city_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[complain_names]    Script Date: 4/12/2016 12:40:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[complain_names](
	[complain_name] [varchar](100) NULL,
	[complain_id] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[complain_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[complaint_deaseses]    Script Date: 4/12/2016 12:40:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[complaint_deaseses](
	[patient_reg] [int] NULL,
	[visit_no] [int] NULL,
	[complaint_id] [int] NULL,
	[severity] [varchar](100) NULL,
	[duration] [varchar](50) NULL,
	[timing] [varchar](50) NULL,
	[details] [varchar](800) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[diseases]    Script Date: 4/12/2016 12:40:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[diseases](
	[disease_name] [varchar](100) NULL,
	[disease_id] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[disease_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[doctor_registeration]    Script Date: 4/12/2016 12:40:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[doctor_registeration](
	[doctor_name] [varchar](50) NULL,
	[PMDC] [varchar](50) NULL,
	[sex] [tinyint] NULL,
	[mobile] [varchar](50) NULL,
	[clinic_address] [varchar](255) NULL,
	[qualification] [varchar](255) NULL,
	[email] [varchar](255) NULL,
	[affiliated_with] [varchar](255) NULL,
	[specialization] [varchar](255) NULL,
	[city_id] [int] NULL,
	[doctor_id] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[doctor_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[general_history]    Script Date: 4/12/2016 12:40:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[general_history](
	[patient_reg] [int] NULL,
	[visit_no] [int] NULL,
	[alcohol] [tinyint] NULL,
	[smoke] [tinyint] NULL,
	[other] [varchar](150) NULL,
	[diabetes] [tinyint] NULL,
	[diabetes_duration] [varchar](50) NULL,
	[diabetes_control] [varchar](50) NULL,
	[FBS] [varchar](50) NULL,
	[insulin] [tinyint] NULL,
	[insulin_dosage] [varchar](50) NULL,
	[hbaic] [varchar](50) NULL,
	[hypertention] [tinyint] NULL,
	[hypertention_duration] [varbinary](150) NULL,
	[hypertention_control] [varchar](150) NULL,
	[cardiac] [varchar](150) NULL,
	[respiratory] [varchar](255) NULL,
	[rinal] [varchar](255) NULL,
	[cancer] [varchar](255) NULL,
	[other_illness] [varchar](255) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[login_hsitory]    Script Date: 4/12/2016 12:40:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[login_hsitory](
	[employee_id] [int] NOT NULL,
	[login] [datetime] NULL,
	[logout] [datetime] NULL,
	[ip_address] [varchar](15) NULL,
	[hostname] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[medicine]    Script Date: 4/12/2016 12:40:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[medicine](
	[med_name] [varchar](255) NULL,
	[med_id] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[med_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[occupation]    Script Date: 4/12/2016 12:40:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[occupation](
	[occupation] [varchar](150) NULL,
	[occupation_id] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[occupation_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[patient_registeration]    Script Date: 4/12/2016 12:40:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[patient_registeration](
	[cnic] [varchar](15) NULL,
	[full_name] [varchar](50) NULL,
	[father_name] [varchar](50) NULL,
	[sex] [tinyint] NULL,
	[address] [varchar](255) NULL,
	[city_id] [int] NULL,
	[mob] [varchar](13) NULL,
	[email] [varchar](255) NULL,
	[attendant_name] [varchar](50) NULL,
	[relation_id] [int] NULL,
	[attendant_mob] [varchar](13) NULL,
	[dob] [date] NULL,
	[ref_doctor_id] [int] NULL,
	[martial_status] [varchar](50) NULL,
	[education] [varchar](50) NULL,
	[occupation_id] [int] NULL,
	[source] [tinyint] NULL,
	[patient_reg] [int] IDENTITY(1,1) NOT NULL,
	[employee_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[patient_reg] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[problem_list_and_diagnoses]    Script Date: 4/12/2016 12:40:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[problem_list_and_diagnoses](
	[patient_reg] [int] NULL,
	[diseases_id] [int] NULL,
	[diagnose_date] [date] NULL,
	[inactive_date] [date] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[systemic_medications]    Script Date: 4/12/2016 12:40:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[systemic_medications](
	[patient_reg] [int] NULL,
	[visit_no] [int] NULL,
	[med_id] [int] NULL,
	[quantity] [int] NULL,
	[morning] [tinyint] NULL,
	[afternoon] [tinyint] NULL,
	[night] [tinyint] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[user_registeration]    Script Date: 4/12/2016 12:40:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[user_registeration](
	[full_name] [varchar](50) NULL,
	[father_name] [varchar](50) NULL,
	[sex] [tinyint] NULL,
	[address] [varchar](50) NULL,
	[mob] [varchar](13) NULL,
	[cnic] [varchar](15) NULL,
	[dob] [date] NULL,
	[email] [varchar](255) NULL,
	[city_id] [int] NULL,
	[date_registeration] [date] NULL,
	[user_type] [varchar](50) NULL,
	[password] [varchar](255) NULL,
	[user_name] [varchar](50) NULL,
	[active] [tinyint] NULL,
	[image] [varchar](255) NULL,
	[employee_id] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[employee_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[visit]    Script Date: 4/12/2016 12:40:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[visit](
	[visit_date] [datetime] NULL,
	[checks] [tinyint] NULL,
	[employee_id] [int] NULL,
	[user_name] [varchar](50) NULL,
	[visit_no] [int] IDENTITY(1,1) NOT NULL,
	[patient_reg] [int] NOT NULL,
 CONSTRAINT [pk_PersonID] PRIMARY KEY CLUSTERED 
(
	[patient_reg] ASC,
	[visit_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[complaint_deaseses]  WITH CHECK ADD  CONSTRAINT [FK_complaint_deaseses_complain_names] FOREIGN KEY([complaint_id])
REFERENCES [dbo].[complain_names] ([complain_id])
GO
ALTER TABLE [dbo].[complaint_deaseses] CHECK CONSTRAINT [FK_complaint_deaseses_complain_names]
GO
ALTER TABLE [dbo].[complaint_deaseses]  WITH CHECK ADD  CONSTRAINT [FK_complaint_deaseses_visit] FOREIGN KEY([patient_reg], [visit_no])
REFERENCES [dbo].[visit] ([patient_reg], [visit_no])
GO
ALTER TABLE [dbo].[complaint_deaseses] CHECK CONSTRAINT [FK_complaint_deaseses_visit]
GO
ALTER TABLE [dbo].[general_history]  WITH CHECK ADD  CONSTRAINT [FK_general_history_visit] FOREIGN KEY([patient_reg], [visit_no])
REFERENCES [dbo].[visit] ([patient_reg], [visit_no])
GO
ALTER TABLE [dbo].[general_history] CHECK CONSTRAINT [FK_general_history_visit]
GO
ALTER TABLE [dbo].[login_hsitory]  WITH CHECK ADD  CONSTRAINT [FK_login_hsitory_user_registeration] FOREIGN KEY([employee_id])
REFERENCES [dbo].[user_registeration] ([employee_id])
GO
ALTER TABLE [dbo].[login_hsitory] CHECK CONSTRAINT [FK_login_hsitory_user_registeration]
GO
ALTER TABLE [dbo].[patient_registeration]  WITH CHECK ADD  CONSTRAINT [FK_patient_registeration_attendantRelation] FOREIGN KEY([relation_id])
REFERENCES [dbo].[attendantRelation] ([relation_id])
GO
ALTER TABLE [dbo].[patient_registeration] CHECK CONSTRAINT [FK_patient_registeration_attendantRelation]
GO
ALTER TABLE [dbo].[patient_registeration]  WITH CHECK ADD  CONSTRAINT [FK_patient_registeration_city] FOREIGN KEY([city_id])
REFERENCES [dbo].[city] ([city_id])
GO
ALTER TABLE [dbo].[patient_registeration] CHECK CONSTRAINT [FK_patient_registeration_city]
GO
ALTER TABLE [dbo].[patient_registeration]  WITH CHECK ADD  CONSTRAINT [FK_patient_registeration_doctor_registeration] FOREIGN KEY([ref_doctor_id])
REFERENCES [dbo].[doctor_registeration] ([doctor_id])
GO
ALTER TABLE [dbo].[patient_registeration] CHECK CONSTRAINT [FK_patient_registeration_doctor_registeration]
GO
ALTER TABLE [dbo].[patient_registeration]  WITH CHECK ADD  CONSTRAINT [FK_patient_registeration_occupation] FOREIGN KEY([occupation_id])
REFERENCES [dbo].[occupation] ([occupation_id])
GO
ALTER TABLE [dbo].[patient_registeration] CHECK CONSTRAINT [FK_patient_registeration_occupation]
GO
ALTER TABLE [dbo].[patient_registeration]  WITH CHECK ADD  CONSTRAINT [FK_patient_registeration_user_registeration] FOREIGN KEY([employee_id])
REFERENCES [dbo].[user_registeration] ([employee_id])
GO
ALTER TABLE [dbo].[patient_registeration] CHECK CONSTRAINT [FK_patient_registeration_user_registeration]
GO
ALTER TABLE [dbo].[problem_list_and_diagnoses]  WITH CHECK ADD  CONSTRAINT [FK_problem_list_and_diagnoses_diseases] FOREIGN KEY([diseases_id])
REFERENCES [dbo].[diseases] ([disease_id])
GO
ALTER TABLE [dbo].[problem_list_and_diagnoses] CHECK CONSTRAINT [FK_problem_list_and_diagnoses_diseases]
GO
ALTER TABLE [dbo].[problem_list_and_diagnoses]  WITH CHECK ADD  CONSTRAINT [FK_problem_list_and_diagnoses_patient_registeration] FOREIGN KEY([patient_reg])
REFERENCES [dbo].[patient_registeration] ([patient_reg])
GO
ALTER TABLE [dbo].[problem_list_and_diagnoses] CHECK CONSTRAINT [FK_problem_list_and_diagnoses_patient_registeration]
GO
ALTER TABLE [dbo].[systemic_medications]  WITH CHECK ADD  CONSTRAINT [FK_systemic_medications_medicine] FOREIGN KEY([med_id])
REFERENCES [dbo].[medicine] ([med_id])
GO
ALTER TABLE [dbo].[systemic_medications] CHECK CONSTRAINT [FK_systemic_medications_medicine]
GO
ALTER TABLE [dbo].[systemic_medications]  WITH CHECK ADD  CONSTRAINT [FK_systemic_medications_visit] FOREIGN KEY([patient_reg], [visit_no])
REFERENCES [dbo].[visit] ([patient_reg], [visit_no])
GO
ALTER TABLE [dbo].[systemic_medications] CHECK CONSTRAINT [FK_systemic_medications_visit]
GO
ALTER TABLE [dbo].[visit]  WITH CHECK ADD  CONSTRAINT [FK_visit_user_registeration] FOREIGN KEY([employee_id])
REFERENCES [dbo].[user_registeration] ([employee_id])
GO
ALTER TABLE [dbo].[visit] CHECK CONSTRAINT [FK_visit_user_registeration]
GO
USE [master]
GO
ALTER DATABASE [doctor] SET  READ_WRITE 
GO
