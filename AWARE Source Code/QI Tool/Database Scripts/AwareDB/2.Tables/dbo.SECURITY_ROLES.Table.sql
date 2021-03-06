USE [AWARE]
GO
/****** Object:  Table [dbo].[SECURITY_ROLES]    Script Date: 8/28/2014 4:46:57 PM ******/
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
ALTER TABLE [dbo].[SECURITY_ROLES] ADD  CONSTRAINT [DF_SECURITY_ROLE_ID]  DEFAULT (newid()) FOR [ID]
GO
