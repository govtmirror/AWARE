USE [AWARE]
GO
/****** Object:  StoredProcedure [dbo].[usp_GetVistaGrpCountById]    Script Date: 8/28/2014 4:46:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_GetVistaGrpCountById]	
	@GroupId UNIQUEIDENTIFIER
AS	
	SET NOCOUNT ON;
	SELECT COUNT(*) FROM AWARE_VISTA_GROUP_MAPPINGS WHERE ID = @GroupId

GO
