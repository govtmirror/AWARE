USE [AWARE]
GO
/****** Object:  StoredProcedure [dbo].[usp_DoesUserExistWFacId]    Script Date: 8/28/2014 4:46:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_DoesUserExistWFacId]
	@UserName VARCHAR(50),
	@FacilityId VARCHAR(50) 
AS	
    SET NOCOUNT ON;
	DECLARE @RowCnt int;
	DECLARE @Exists bit;

	SET @Exists = 0;
	set @RowCnt =
	(
		SELECT COUNT(*) FROM USERS WHERE USER_NAME = @UserName AND FACILITY_ID = @FacilityId
	)

	IF @RowCnt > 0
	BEGIN
		SET @Exists = 1;
	END

	SELECT @Exists;

GO
