USE [AWARE]
GO
/****** Object:  StoredProcedure [dbo].[usp_Report_GetAlertsByFacilityService]    Script Date: 8/28/2014 4:46:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[usp_Report_GetAlertsByFacilityService]
	@InputFacility VARCHAR(50),
	@InputService VARCHAR(50),
	@InputStart DateTime,
	@InputEnd DateTime
AS	
	SELECT STATION_DATETIME_ALERTID,ALERTID,DATETIME1,FACILITYNAME,SERVICE1,ORDERINGPROVIDER, 
                        ALERTRECIPIENTS,SPARE,ALERTCATEGORY,ALERTTYPE,VALUE1,UNACKSTATUS,ACKRENEWDATE, 
                        DELETEDATE,FATSTATUS,FATPROVIDER,FOLLOW_UPPROVIDERID,CLINIC,PATIENTID,ALERTRESULTOR, 
                        RESULTORPERSONCLASS,ALERTTYPEORIGSTATION, CASE WHEN ACKGT7D = 1 THEN 'Yes' ELSE 'No' END AS ACKGT7D, 
                         CASE WHEN FOLLOWUPGT7D = 1 THEN 'Yes' ELSE 'No' END AS FOLLOWUPGT7D, 
                         CASE WHEN FOLLOWUPLT7D = 1 THEN 'Yes' ELSE 'No' END AS FOLLOWUPLT7D
	FROM Alerts$
	WHERE FACILITYNAME = @InputFacility and SERVICE1 = @InputService
		and DATETIME1 >= @InputStart and DATETIME1 < DATEADD(day,1,@InputEnd)



GO
