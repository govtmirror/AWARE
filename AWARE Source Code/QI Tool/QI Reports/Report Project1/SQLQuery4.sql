/****** Script for SelectTopNRows command from SSMS  ******/
DROP TABLE [consults].[dbo].[TestStationDIM$] SELECT TOP 200 
      [Sta3n]      
  INTO [consults].[dbo].[TestStationDIM$]
  FROM [consults].[dbo].[TestInstitutionDIM$]