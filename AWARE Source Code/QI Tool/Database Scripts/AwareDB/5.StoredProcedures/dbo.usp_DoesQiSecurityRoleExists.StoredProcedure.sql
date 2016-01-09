USE [AWARE]
GO
/****** Object:  StoredProcedure [dbo].[usp_DoesQiSecurityRoleExists]    Script Date: 8/28/2014 4:46:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_DoesQiSecurityRoleExists]		
	@QiGroupId UNIQUEIDENTIFIER,
	@UserId UNIQUEIDENTIFIER
AS	
    SET NOCOUNT ON;
	SELECT COUNT(*) FROM SECURITY_ROLES WHERE GROUP_ID = @QiGroupId AND USER_ID = @UserId

GO
