USE [AWARE]
GO
/****** Object:  StoredProcedure [dbo].[usp_CanGroupSeeAll]    Script Date: 8/28/2014 4:46:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_CanGroupSeeAll]
	@VistaGrpId VARCHAR(50)
AS	
	SET NOCOUNT ON;
	SELECT COUNT(*) FROM SECURITY_RIGHTS WHERE OBJECT_TYPE_ID = 2 AND OBJECT_ID = @VistaGrpId

GO
