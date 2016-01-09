USE [AWARE]
GO
/****** Object:  StoredProcedure [dbo].[usp_DeleteSecurityRightByEntity]    Script Date: 8/28/2014 4:46:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_DeleteSecurityRightByEntity]
	@EntityId UNIQUEIDENTIFIER
AS	
	SET NOCOUNT ON;
	DELETE FROM SECURITY_RIGHTS WHERE ENTITY_ID = @EntityId

GO
