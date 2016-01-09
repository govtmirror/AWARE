USE [AWARE]
GO
/****** Object:  StoredProcedure [dbo].[usp_AddUserToQiGroup]    Script Date: 8/28/2014 4:46:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_AddUserToQiGroup]		
	@QiGroupId UNIQUEIDENTIFIER,
	@UserId UNIQUEIDENTIFIER
AS	
    SET NOCOUNT ON;
	INSERT SECURITY_ROLES (GROUP_ID, USER_ID) VALUES (@QiGroupId, @UserId)

GO
