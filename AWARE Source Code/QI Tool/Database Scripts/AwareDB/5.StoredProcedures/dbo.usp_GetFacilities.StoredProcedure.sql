USE [AWARE]
GO
/****** Object:  StoredProcedure [dbo].[usp_GetFacilities]    Script Date: 8/28/2014 4:46:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_GetFacilities]			
AS	
    SET NOCOUNT ON;
	SELECT ID, NAME FROM FACILITIES

GO
