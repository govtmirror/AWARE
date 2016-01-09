USE [AWARE]
GO
/****** Object:  StoredProcedure [dbo].[usp_DeleteAwareVistaGroupMapping]    Script Date: 8/28/2014 4:46:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_DeleteAwareVistaGroupMapping]	
	@GroupId UNIQUEIDENTIFIER
AS	
	SET NOCOUNT ON;
	DELETE FROM AWARE_VISTA_GROUP_MAPPINGS WHERE ID = @GroupId

GO
