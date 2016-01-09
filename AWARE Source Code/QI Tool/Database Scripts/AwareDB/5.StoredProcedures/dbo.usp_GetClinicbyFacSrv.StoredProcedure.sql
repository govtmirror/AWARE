USE [AWARE]
GO
/****** Object:  StoredProcedure [dbo].[usp_GetClinicbyFacSrv]    Script Date: 8/28/2014 4:46:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_GetClinicbyFacSrv]	
	@FacilityName VARCHAR(50),
	@Service VARCHAR(50)			
AS	
	SET NOCOUNT ON;
	SELECT Distinct(Clinic) FROM Clinic$ 
		WHERE FacilityName= @FacilityName AND Service = @Service

GO
