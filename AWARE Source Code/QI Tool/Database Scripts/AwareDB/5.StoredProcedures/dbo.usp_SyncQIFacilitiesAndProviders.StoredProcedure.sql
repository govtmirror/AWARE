USE [AWARE]
GO
/****** Object:  StoredProcedure [dbo].[usp_SyncQIFacilitiesAndProviders]    Script Date: 8/28/2014 4:46:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_SyncQIFacilitiesAndProviders]				
AS	
    SET NOCOUNT ON;
	EXEC usp_UpdateFacilities
	EXEC usp_UpdateProviders

GO
