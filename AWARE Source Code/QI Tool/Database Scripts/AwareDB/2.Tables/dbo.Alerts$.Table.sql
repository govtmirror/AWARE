USE [AWARE]
GO
/****** Object:  Table [dbo].[Alerts$]    Script Date: 8/28/2014 4:46:57 PM ******/
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
