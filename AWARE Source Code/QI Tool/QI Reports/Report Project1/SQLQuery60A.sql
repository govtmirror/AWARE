/****** Script for SelectTopNRows command from SSMS  ******/
DROP TABLE ClinicType25$ SELECT [STA3N]
      ,[consultSID]
      ,[StopCode]
      ,[ToRequestServiceName]
      ,[StopCodeSID]
      ,[ReferringPrimaryStopCode]
      ,[ReferringSecondaryStopCode]
      ,[ToRequestServiceSID]
      ,[PatientLocationSID]
      ,[RequestDateTime]
      ,[FromLocationSID]
      ,[AttentionToStaffSID]
      ,[CPRSStatus]
      ,[FileEntryVistaDate]
      ,[ConsultIEN]
      ,[PatientSID]
      ,[OrderingInstitutionSID]
      ,[RoutingInstitutionSID]
      ,NULL AS ConsultInitiationDate
      ,NULL AS WaitTime
      ,(CASE WHEN
           ([CPRSStatus] = 'CANCELLED') OR ([CPRSStatus] = 'DISCONTINUED')
        THEN 0
        ELSE 1
        END) AS WaitTimeGT15DaysWoVisit
      ,(CASE WHEN
           [CPRSStatus] = 'CANCELLED'
        THEN 1
        ELSE 0
        END) AS CancelledAppointmentYesNo
      ,(CASE WHEN
           [CPRSStatus] = 'DISCONTINUED'
        THEN 1
        ELSE 0
        END) AS DiscontinuedAppointmentYesNo
  INTO [consults].[dbo].ClinicType25$
  FROM [consults].[dbo].[ClinicType20$]
 
  