USE [AWARE]
GO
/****** Object:  StoredProcedure [dbo].[usp_GetVistaProviderGroupId]    Script Date: 8/28/2014 4:46:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_GetVistaProviderGroupId]
	@ProviderId VARCHAR(50)	
AS	
	SET NOCOUNT ON;
	SELECT avgm.AWARE_GROUP_ID FROM AWARE_VISTA_GROUP_MAPPINGS avgm JOIN PROVIDERS prv ON prv.VISTA_GROUP_ID = avgm.ID WHERE PRV.ID = @ProviderId

GO
