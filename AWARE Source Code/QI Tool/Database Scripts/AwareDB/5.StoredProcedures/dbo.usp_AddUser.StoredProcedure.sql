USE [AWARE]
GO
/****** Object:  StoredProcedure [dbo].[usp_AddUser]    Script Date: 8/28/2014 4:46:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_AddUser]
	@UserName VARCHAR(50),
	@FacilityId VARCHAR(50),
	@VerifyCode VARCHAR(50) 
AS	
    SET NOCOUNT ON;
	INSERT INTO USERS (USER_NAME, FACILITY_ID, VERIFY_CODE  ) VALUES (@UserName, @FacilityId, @VerifyCode)

GO
