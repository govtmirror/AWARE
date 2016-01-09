USE [AWARE]
GO
/****** Object:  StoredProcedure [dbo].[usp_UpdateUser]    Script Date: 8/28/2014 4:46:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_UpdateUser]
	@UserName VARCHAR(50),
	@FacilityId VARCHAR(50),
	@VerifyCode VARCHAR(50),
	@UserId UNIQUEIDENTIFIER
AS	
    SET NOCOUNT ON;
	UPDATE USERS SET USER_NAME = @UserName, FACILITY_ID = @FacilityId, VERIFY_CODE = @VerifyCode WHERE ID = @UserId

GO
