USE [AWARE]
GO
/****** Object:  StoredProcedure [dbo].[usp_DeleteQiRole]    Script Date: 8/28/2014 4:46:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_DeleteQiRole]		
	@QiRoleId UNIQUEIDENTIFIER	
AS	
    SET NOCOUNT ON;
	DELETE FROM SECURITY_ROLES WHERE ID = @QiRoleId

GO
