USE [AWARE]
GO
/****** Object:  StoredProcedure [dbo].[usp_GetReportsRec]    Script Date: 8/28/2014 4:46:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_GetReportsRec]	
	@RptId UNIQUEIDENTIFIER,
	@ObjTypeId INT	
AS	
	SET NOCOUNT ON;
	SELECT ID, OBJECT_NAME, PRESENTATION_NAME FROM SECURITY_ITEMS WHERE OBJECT_TYPE_ID = @ObjTypeId AND ID = @RptId

GO
