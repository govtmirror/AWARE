USE [AWARE]
GO
/****** Object:  Table [dbo].[PROVIDERS]    Script Date: 8/28/2014 4:46:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PROVIDERS](
	[ID] [uniqueidentifier] NOT NULL,
	[NAME] [varchar](50) NOT NULL,
	[VISTA_ID] [varchar](50) NOT NULL,
	[VISTA_GROUP_ID] [uniqueidentifier] NULL,
 CONSTRAINT [PK_PROVIDERS] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[PROVIDERS] ADD  CONSTRAINT [DF_PROVIDERS_ID]  DEFAULT (newid()) FOR [ID]
GO
