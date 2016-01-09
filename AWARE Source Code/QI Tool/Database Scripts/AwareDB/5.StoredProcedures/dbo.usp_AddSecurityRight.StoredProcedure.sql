USE [AWARE]
GO
/****** Object:  StoredProcedure [dbo].[usp_AddSecurityRight]    Script Date: 8/28/2014 4:46:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_AddSecurityRight]	
	@ObjTypeId INT,
	@ObjectId UNIQUEIDENTIFIER,
	@EntityId UNIQUEIDENTIFIER
AS	
	SET NOCOUNT ON;
	INSERT SECURITY_RIGHTS (OBJECT_TYPE_ID, OBJECT_ID, ENTITY_ID) VALUES (@ObjTypeId, @ObjectId, @EntityId)

GO
