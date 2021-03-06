USE [master]
GO
/****** Object:  Database [AWARE]    Script Date: 04/28/2014 15:51:12 ******/
CREATE DATABASE [AWARE] ON  PRIMARY 
( NAME = N'AWARE', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER2012\MSSQL\DATA\AWARE.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'AWARE_log', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER2012\MSSQL\DATA\AWARE_log.ldf' , SIZE = 1785856KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [AWARE] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AWARE].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AWARE] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [AWARE] SET ANSI_NULLS OFF
GO
ALTER DATABASE [AWARE] SET ANSI_PADDING OFF
GO
ALTER DATABASE [AWARE] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [AWARE] SET ARITHABORT OFF
GO
ALTER DATABASE [AWARE] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [AWARE] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [AWARE] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [AWARE] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [AWARE] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [AWARE] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [AWARE] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [AWARE] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [AWARE] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [AWARE] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [AWARE] SET  DISABLE_BROKER
GO
ALTER DATABASE [AWARE] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [AWARE] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [AWARE] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [AWARE] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [AWARE] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [AWARE] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [AWARE] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [AWARE] SET  READ_WRITE
GO
ALTER DATABASE [AWARE] SET RECOVERY FULL
GO
ALTER DATABASE [AWARE] SET  MULTI_USER
GO
ALTER DATABASE [AWARE] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [AWARE] SET DB_CHAINING OFF
GO
USE [AWARE]
GO
/****** Object:  Table [dbo].[Service$]    Script Date: 04/28/2014 15:51:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Service$](
	[FacilityName] [varchar](50) NOT NULL,
	[Service] [varchar](50) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SECURITY_ROLES]    Script Date: 04/28/2014 15:51:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SECURITY_ROLES](
	[ID] [uniqueidentifier] NOT NULL,
	[GROUP_ID] [uniqueidentifier] NOT NULL,
	[USER_ID] [uniqueidentifier] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SECURITY_RIGHTS]    Script Date: 04/28/2014 15:51:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SECURITY_RIGHTS](
	[ID] [uniqueidentifier] NOT NULL,
	[OBJECT_TYPE_ID] [int] NOT NULL,
	[OBJECT_ID] [uniqueidentifier] NOT NULL,
	[ENTITY_ID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_SECURITY_RIGHTS] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SECURITY_ITEMS]    Script Date: 04/28/2014 15:51:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SECURITY_ITEMS](
	[ID] [uniqueidentifier] NOT NULL,
	[OBJECT_TYPE_ID] [int] NOT NULL,
	[OBJECT_NAME] [varchar](100) NOT NULL,
 CONSTRAINT [PK_SECURITY_ITEMS] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SECURITY_GROUPS]    Script Date: 04/28/2014 15:51:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SECURITY_GROUPS](
	[ID] [uniqueidentifier] NOT NULL,
	[GROUP_NAME] [varchar](50) NOT NULL,
	[ACTIVE] [bit] NOT NULL,
 CONSTRAINT [PK_SECURITY_GROUPS] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OrderingProviderAllServices$]    Script Date: 04/28/2014 15:51:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OrderingProviderAllServices$](
	[FacilityName] [varchar](50) NULL,
	[OrderingProvider] [varchar](50) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OrderingProviderAllClinics$]    Script Date: 04/28/2014 15:51:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OrderingProviderAllClinics$](
	[FacilityName] [varchar](50) NULL,
	[Service] [varchar](50) NULL,
	[OrderingProvider] [varchar](50) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OrderingProvider$]    Script Date: 04/28/2014 15:51:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OrderingProvider$](
	[FacilityName] [varchar](50) NOT NULL,
	[Service] [varchar](50) NOT NULL,
	[Clinic] [varchar](50) NOT NULL,
	[OrderingProvider] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Followups$]    Script Date: 04/28/2014 15:51:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Followups$](
	[STATION_DATETIME_ALERTID] [varchar](50) NOT NULL,
	[FOLLOWUP] [varchar](50) NOT NULL,
	[FOLLOWUPDATETIME] [datetime] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FacilityName$]    Script Date: 04/28/2014 15:51:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FacilityName$](
	[FacilityName] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Clinic$]    Script Date: 04/28/2014 15:51:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Clinic$](
	[FacilityName] [varchar](50) NOT NULL,
	[Service] [varchar](50) NOT NULL,
	[Clinic] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AlertType$]    Script Date: 04/28/2014 15:51:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AlertType$](
	[FacilityName] [varchar](50) NOT NULL,
	[Service] [varchar](50) NOT NULL,
	[Clinic] [varchar](50) NOT NULL,
	[OrderingProvider] [varchar](50) NOT NULL,
	[AlertType] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Alerts$]    Script Date: 04/28/2014 15:51:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Alerts$](
	[STATION_DATETIME_ALERTID] [varchar](50) NULL,
	[ALERTID] [varchar](50) NULL,
	[DATETIME1] [datetime] NULL,
	[FACILITYNAME] [varchar](50) NULL,
	[SERVICE1] [varchar](50) NULL,
	[ORDERINGPROVIDER] [varchar](50) NULL,
	[ALERTRECIPIENTS] [varchar](max) NULL,
	[SPARE] [varchar](50) NULL,
	[ALERTCATEGORY] [varchar](50) NULL,
	[ALERTTYPE] [varchar](50) NULL,
	[VALUE1] [varchar](50) NULL,
	[UNACKSTATUS] [varchar](50) NULL,
	[ACKRENEWDATE] [varchar](50) NULL,
	[DELETEDATE] [varchar](50) NULL,
	[FATSTATUS] [varchar](50) NULL,
	[FATPROVIDER] [varchar](50) NULL,
	[FOLLOW_UPPROVIDERID] [nvarchar](50) NULL,
	[CLINIC] [varchar](50) NULL,
	[PATIENTID] [nvarchar](50) NULL,
	[ALERTRESULTOR] [varchar](50) NULL,
	[RESULTORPERSONCLASS] [varchar](50) NULL,
	[ALERTTYPEORIGSTATION] [nvarchar](50) NULL,
	[FOLLOWUPGT7D] [nchar](10) NULL,
	[ACKGT7D] [nchar](10) NULL,
	[FOLLOWUPLT7D] [nchar](10) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[USERS]    Script Date: 04/28/2014 15:51:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[USERS](
	[ID] [uniqueidentifier] NOT NULL,
	[USER_NAME] [varchar](50) NOT NULL,
	[AD_NAME] [varchar](100) NULL,
	[AD_SID] [varchar](50) NULL,
	[PASSWORD] [varchar](128) NULL,
	[SECURITY_GROUP_ID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_USERS] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TestTable$]    Script Date: 04/28/2014 15:51:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TestTable$](
	[Column1] [varchar](50) NULL,
	[Column2] [nchar](10) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[SERVICES]    Script Date: 04/28/2014 15:51:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[SERVICES]
AS
SELECT DISTINCT SERVICE1
FROM         dbo.Alerts$
GROUP BY SERVICE1
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Alerts$"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 114
               Right = 266
            End
            DisplayFlags = 280
            TopColumn = 4
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'SERVICES'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'SERVICES'
GO
/****** Object:  View [dbo].[FACILITIES]    Script Date: 04/28/2014 15:51:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[FACILITIES]
AS
SELECT DISTINCT FACILITYNAME
FROM         dbo.Alerts$
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Alerts$"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 114
               Right = 266
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'FACILITIES'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'FACILITIES'
GO
/****** Object:  Default [DF_SECURITY_ROLE_ID]    Script Date: 04/28/2014 15:51:14 ******/
ALTER TABLE [dbo].[SECURITY_ROLES] ADD  CONSTRAINT [DF_SECURITY_ROLE_ID]  DEFAULT (newid()) FOR [ID]
GO
/****** Object:  Default [DF_SECURITY_RIGHTS_ID]    Script Date: 04/28/2014 15:51:14 ******/
ALTER TABLE [dbo].[SECURITY_RIGHTS] ADD  CONSTRAINT [DF_SECURITY_RIGHTS_ID]  DEFAULT (newid()) FOR [ID]
GO
/****** Object:  Default [DF_SECURITY_ITEMS_ID]    Script Date: 04/28/2014 15:51:14 ******/
ALTER TABLE [dbo].[SECURITY_ITEMS] ADD  CONSTRAINT [DF_SECURITY_ITEMS_ID]  DEFAULT (newid()) FOR [ID]
GO
/****** Object:  Default [DF_SECURITY_GROUPS_ID]    Script Date: 04/28/2014 15:51:14 ******/
ALTER TABLE [dbo].[SECURITY_GROUPS] ADD  CONSTRAINT [DF_SECURITY_GROUPS_ID]  DEFAULT (newid()) FOR [ID]
GO
/****** Object:  Default [DF_USERS_ID]    Script Date: 04/28/2014 15:51:14 ******/
ALTER TABLE [dbo].[USERS] ADD  CONSTRAINT [DF_USERS_ID]  DEFAULT (newid()) FOR [ID]
GO
