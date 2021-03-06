USE [AWARE]
GO
/****** Object:  StoredProcedure [dbo].[usp_SelectProvider]    Script Date: 8/28/2014 4:46:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_SelectProvider]
	@OrdProvTbl VARCHAR(50),
	@FacilityName VARCHAR(50),	
	@Service VARCHAR(50) = NULL	,
	@Clinic VARCHAR(50) = NULL,
	@ViewAll BIT = NULL,
	@ProviderId VARCHAR(50)	= NULL
AS	
	DECLARE @sqlCmd NVARCHAR(4000)
    SET NOCOUNT ON;
	SELECT @sqlCmd ='SELECT Distinct(OrderingProvider) FROM ' + '' + @OrdProvTbl + ''  + ' WHERE FacilityName = ''' + '' + @FacilityName + ''''

	IF @Service IS NOT NULL 
		SELECT @sqlCmd = @sqlCmd + N' AND Service = ' + '''' + @Service +''''

	IF @Clinic IS NOT NULL 
			SELECT @sqlCmd = @sqlCmd + N' AND Clinic = ' + '''' + @Clinic + ''''

	IF @ViewAll IS NOT NULL
		IF @ViewAll = 0
			SELECT @sqlCmd = @sqlCmd + N' AND OrderingProvider LIKE ' + '''%[[' + @ProviderId + ']]'''

	execute sp_executesql @sqlCmd

GO
