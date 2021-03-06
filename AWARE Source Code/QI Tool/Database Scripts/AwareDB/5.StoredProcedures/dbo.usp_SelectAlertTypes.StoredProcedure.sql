USE [AWARE]
GO
/****** Object:  StoredProcedure [dbo].[usp_SelectAlertTypes]    Script Date: 8/28/2014 4:46:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_SelectAlertTypes]
	@FacilityName VARCHAR(50),	
	@Service VARCHAR(50) = NULL	,
	@Clinic VARCHAR(50) = NULL,
	@Provider VARCHAR(50)	= NULL
AS	
	SET NOCOUNT ON;
	SELECT Distinct(AlertType) FROM AlertType$ 
	WHERE FacilityName = @FacilityName
		AND Service = @Service
		AND Clinic = @Clinic
		AND OrderingProvider = @Provider	

GO
