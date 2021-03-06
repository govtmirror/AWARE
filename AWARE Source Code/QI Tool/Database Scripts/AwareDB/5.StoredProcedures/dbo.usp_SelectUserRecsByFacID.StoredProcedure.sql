USE [AWARE]
GO
/****** Object:  StoredProcedure [dbo].[usp_SelectUserRecsByFacID]    Script Date: 8/28/2014 4:46:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_SelectUserRecsByFacID]
	@FacilityId VARCHAR(50) = NULL,	
	@SortAsc bit = NULL
AS	
	DECLARE @sqlCmd NVARCHAR(4000)
    SET NOCOUNT ON;
	SELECT @sqlCmd ='SELECT ID, USER_NAME, FACILITY_ID FROM USERS '

	IF @FacilityId IS NOT NULL 
		SELECT @sqlCmd = @sqlCmd + N'WHERE FACILITY_ID = ' + '''' + @FacilityId +''''

	IF @SortAsc IS NOT NULL 
			SELECT @sqlCmd = @sqlCmd + N'ORDER BY USER_NAME ASC'	

	execute sp_executesql @sqlCmd

GO
