USE [AWARE]
GO
/****** Object:  Table [dbo].[USERS]    Script Date: 8/28/2014 4:46:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[USERS](
	[ID] [uniqueidentifier] NOT NULL,
	[USER_NAME] [varchar](50) NOT NULL,
	[FACILITY_ID] [uniqueidentifier] NOT NULL,
	[VERIFY_CODE] [varchar](50) NOT NULL,
 CONSTRAINT [PK_USERS] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[USERS] ADD  CONSTRAINT [DF_USERS_ID]  DEFAULT (newid()) FOR [ID]
GO
