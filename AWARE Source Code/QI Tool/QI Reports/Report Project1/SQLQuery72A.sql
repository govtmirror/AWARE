/****** Script for SelectTopNRows command from SSMS  ******/
DROP TABLE ClinicType26$ SELECT [ConsultSID]
      ,[STA3N]
      ,[PatientLocationSID]
      ,[RequestDateTime]
      ,[FromLocationSID]
      ,[ToRequestServiceName]
      ,[AttentionToStaffSID]
      ,[CPRSStatus]
      ,[InstitutionIEN]
      ,[FileEntryVistaDate]
      ,[ConsultIEN]
      ,[InstitutionName]
      ,[ToRequestServiceSID]
      ,[PatientSID]
      ,[VisitVistaDate]
      ,[PrimaryStopCode]
      ,[LocationName]
      ,[Sta3n1]
      ,[PrimaryStopCodeSID]
      ,[StopCodeSID]
      ,[StopCodeName]
      ,[VisitSID]
      ,[LocationSID]
      ,[VisitCreatedDate]
      ,[OrderingInstitutionSID]
      ,[RoutingInstitutionSID]
      ,[AppointmentDateTime] as ConsultInitiationDate
      ,DATEDIFF(DAY,[RequestDateTime],[AppointmentDateTime]) AS WaitTime
      ,(CASE WHEN
           DATEDIFF(DAY,[RequestDateTime],[AppointmentDateTime]) > 15
        THEN 1
        ELSE 0
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
  INTO [consults].[dbo].ClinicType26$
  FROM [consults].[dbo].[ClinicType23$]