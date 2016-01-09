USE [AWARE]
GO
/****** Object:  StoredProcedure [dbo].[usp_GetVistaProviderID]    Script Date: 8/28/2014 4:46:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_GetVistaProviderID]
	@VistaId VARCHAR(50)	
AS	
	SET NOCOUNT ON;
	SELECT TOP 1 ID FROM PROVIDERS WHERE VISTA_ID = @VistaId

GO
