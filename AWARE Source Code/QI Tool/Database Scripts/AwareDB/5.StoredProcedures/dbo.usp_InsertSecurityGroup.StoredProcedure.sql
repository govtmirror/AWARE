USE [AWARE]
GO
/****** Object:  StoredProcedure [dbo].[usp_InsertSecurityGroup]    Script Date: 8/28/2014 4:46:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_InsertSecurityGroup]
	@GroupName VARCHAR(50),
	@Active BIT
AS	
	SET NOCOUNT ON;
	INSERT INTO SECURITY_GROUPS (GROUP_NAME, ACTIVE) VALUES ( @GroupName, @Active)

GO
