USE [AWARE]
GO
/****** Object:  StoredProcedure [dbo].[usp_Report_GetAlertsWithFollowupsByFacilityServiceClinicProvider]    Script Date: 8/28/2014 4:46:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[usp_Report_GetAlertsWithFollowupsByFacilityServiceClinicProvider]
	@InputFacility VARCHAR(50),
	@InputService VARCHAR(50),
	@InputClinic VARCHAR(50),
	@InputProvider VARCHAR(50),
	@InputStart DateTime,
	@InputEnd DateTime
AS	
	SELECT   Alerts$.STATION_DATETIME_ALERTID, Alerts$.ALERTID, Alerts$.DATETIME1, Alerts$.FACILITYNAME, Alerts$.SERVICE1, Alerts$.ORDERINGPROVIDER, 
                         Alerts$.ALERTRECIPIENTS, Alerts$.SPARE, Alerts$.ALERTCATEGORY, Alerts$.ALERTTYPE, Alerts$.VALUE1, Alerts$.UNACKSTATUS, Alerts$.ACKRENEWDATE, 
                         Alerts$.DELETEDATE, Alerts$.FATSTATUS, Alerts$.FATPROVIDER, Alerts$.FOLLOW_UPPROVIDERID, Alerts$.CLINIC, Alerts$.PATIENTID, Alerts$.ALERTRESULTOR, 
                         Alerts$.RESULTORPERSONCLASS, Alerts$.ALERTTYPEORIGSTATION, CASE WHEN Alerts$.ACKGT7D = 1 THEN 'Yes' ELSE 'No' END AS ACKGT7D, 
                         CASE WHEN Alerts$.FOLLOWUPGT7D = 1 THEN 'Yes' ELSE 'No' END AS FOLLOWUPGT7D, 
                         CASE WHEN Alerts$.FOLLOWUPLT7D = 1 THEN 'Yes' ELSE 'No' END AS FOLLOWUPLT7D, Followups$.STATION_DATETIME_ALERTID AS Expr1, 
                         Followups$.FOLLOWUP, Followups$.FOLLOWUPDATETIME
	FROM Alerts$ LEFT OUTER JOIN Followups$ ON Alerts$.STATION_DATETIME_ALERTID = Followups$.STATION_DATETIME_ALERTID	
	WHERE Alerts$.FACILITYNAME = @InputFacility and Alerts$.SERVICE1 = @InputService 
		and Alerts$.CLINIC = @InputClinic and Alerts$.ORDERINGPROVIDER = @InputProvider 
		and Alerts$.DATETIME1 >= @InputStart and Alerts$.DATETIME1 < DATEADD(day,1,@InputEnd)









GO
