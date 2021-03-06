USE [AWARE]
GO
/****** Object:  StoredProcedure [dbo].[usp_UpdateVistaGroupMapping]    Script Date: 8/28/2014 4:46:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_UpdateVistaGroupMapping]	
	@GroupName VARCHAR(50),
	@FacilityId UNIQUEIDENTIFIER,
	@AwareGrpId UNIQUEIDENTIFIER,
	@VistaGrpId UNIQUEIDENTIFIER
AS	
	SET NOCOUNT ON;
	UPDATE AWARE_VISTA_GROUP_MAPPINGS 
		SET NAME = @GroupName,
			AWARE_GROUP_ID = @AwareGrpId,
			FACILITY_ID = @FacilityId
	WHERE ID = @VistaGrpId

GO
