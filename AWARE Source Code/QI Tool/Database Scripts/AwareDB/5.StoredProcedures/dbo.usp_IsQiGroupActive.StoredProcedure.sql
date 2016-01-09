USE [AWARE]
GO
/****** Object:  StoredProcedure [dbo].[usp_IsQiGroupActive]    Script Date: 8/28/2014 4:46:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_IsQiGroupActive]		
	@QiGroupId UNIQUEIDENTIFIER		
AS	
    SET NOCOUNT ON;
	SELECT ACTIVE FROM SECURITY_GROUPS WHERE ID = @QiGroupId

GO
