USE [AWARE]
GO
/****** Object:  StoredProcedure [dbo].[usp_GetProviderNameById]    Script Date: 8/28/2014 4:46:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_GetProviderNameById]
	@UserId VARCHAR(50)
AS		
    SET NOCOUNT ON;
	SELECT NAME FROM PROVIDERS WHERE ID = @UserId

GO
