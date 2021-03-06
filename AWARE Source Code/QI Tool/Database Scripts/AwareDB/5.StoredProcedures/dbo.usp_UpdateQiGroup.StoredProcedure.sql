USE [AWARE]
GO
/****** Object:  StoredProcedure [dbo].[usp_UpdateQiGroup]    Script Date: 8/28/2014 4:46:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_UpdateQiGroup]		
	@QiGroupName VARCHAR(50),
	@QiGroupActive BIT,	
	@QiGroupId UNIQUEIDENTIFIER
AS	
    SET NOCOUNT ON;
	UPDATE SECURITY_GROUPS 
		SET GROUP_NAME = @QiGroupName, 
		ACTIVE = @QiGroupActive 
	WHERE ID = @QiGroupId

GO
