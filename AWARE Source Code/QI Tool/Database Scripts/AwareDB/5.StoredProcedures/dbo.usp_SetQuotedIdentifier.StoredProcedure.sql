USE [AWARE]
GO
/****** Object:  StoredProcedure [dbo].[usp_SetQuotedIdentifier]    Script Date: 8/28/2014 4:46:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_SetQuotedIdentifier]	
	@OnOff BIT		
AS	
	SET NOCOUNT ON;
	IF @OnOff = 0
		SET QUOTED_IDENTIFIER OFF
	ELSE
		SET QUOTED_IDENTIFIER ON

GO
