USE [AWARE]
GO
/****** Object:  StoredProcedure [dbo].[usp_DeleteSecurityRight]    Script Date: 8/28/2014 4:46:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_DeleteSecurityRight]
	@EntityId VARCHAR(50),
	@ObjectType INT = NULL,
	@ObjectId VARCHAR(50) = NULL
AS	
	SET NOCOUNT ON;
	DECLARE @sqlCmd NVARCHAR(4000)
	SELECT @sqlCmd = N'DELETE FROM SECURITY_RIGHTS WHERE ENTITY_ID = ' + '''' + @EntityId + ''''
	IF @ObjectType IS NOT NULL
		SELECT @sqlCmd = @sqlCmd + N' AND OBJECT_TYPE_ID = '  + CAST(@ObjectType as nvarchar)
	IF @ObjectId IS NOT NULL
		SELECT @sqlCmd = @sqlCmd + N' AND OBJECT_ID = ' + '''' + @ObjectId + ''''

	EXECUTE sp_executesql @sqlCmd

GO
