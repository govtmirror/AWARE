USE [AWARE]
GO
/****** Object:  StoredProcedure [dbo].[usp_Report_GetAlertsByFacility]    Script Date: 05/06/2014 14:30:02 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Report_GetAlertsByFacility]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_Report_GetAlertsByFacility]
GO
/****** Object:  StoredProcedure [dbo].[usp_Report_GetAlertsByFacilityService]    Script Date: 05/06/2014 14:30:02 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Report_GetAlertsByFacilityService]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_Report_GetAlertsByFacilityService]
GO
/****** Object:  StoredProcedure [dbo].[usp_Report_GetAlertsByFacilityServiceClinic]    Script Date: 05/06/2014 14:30:02 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Report_GetAlertsByFacilityServiceClinic]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_Report_GetAlertsByFacilityServiceClinic]
GO
/****** Object:  StoredProcedure [dbo].[usp_Report_GetAlertsByFacilityServiceClinicProvider]    Script Date: 05/06/2014 14:30:02 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Report_GetAlertsByFacilityServiceClinicProvider]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_Report_GetAlertsByFacilityServiceClinicProvider]
GO
/****** Object:  StoredProcedure [dbo].[usp_Report_GetAlertsByFacilityServiceProvider]    Script Date: 05/06/2014 14:30:02 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Report_GetAlertsByFacilityServiceProvider]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_Report_GetAlertsByFacilityServiceProvider]
GO
/****** Object:  StoredProcedure [dbo].[usp_Report_GetAlertsByFacilitySProvider]    Script Date: 05/06/2014 14:30:02 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Report_GetAlertsByFacilitySProvider]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_Report_GetAlertsByFacilitySProvider]
GO
/****** Object:  StoredProcedure [dbo].[usp_Report_GetAlertsWithFollowupsByFacilityProvider]    Script Date: 05/06/2014 14:30:02 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Report_GetAlertsWithFollowupsByFacilityProvider]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_Report_GetAlertsWithFollowupsByFacilityProvider]
GO
/****** Object:  StoredProcedure [dbo].[usp_Report_GetAlertsWithFollowupsByFacilityServiceClinicProvider]    Script Date: 05/06/2014 14:30:02 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Report_GetAlertsWithFollowupsByFacilityServiceClinicProvider]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_Report_GetAlertsWithFollowupsByFacilityServiceClinicProvider]
GO
/****** Object:  StoredProcedure [dbo].[usp_Report_GetAlertsWithFollowupsByFacilityServiceClinicProviderAlterType]    Script Date: 05/06/2014 14:30:02 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Report_GetAlertsWithFollowupsByFacilityServiceClinicProviderAlterType]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_Report_GetAlertsWithFollowupsByFacilityServiceClinicProviderAlterType]
GO
/****** Object:  StoredProcedure [dbo].[usp_Report_GetAlertsWithFollowupsByFacilityServiceProvider]    Script Date: 05/06/2014 14:30:02 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Report_GetAlertsWithFollowupsByFacilityServiceProvider]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_Report_GetAlertsWithFollowupsByFacilityServiceProvider]
GO
/****** Object:  StoredProcedure [dbo].[usp_Report_GetAlertsWithFollowupsByFacilityServiceProvider]    Script Date: 05/06/2014 14:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Report_GetAlertsWithFollowupsByFacilityServiceProvider]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'



CREATE PROCEDURE [dbo].[usp_Report_GetAlertsWithFollowupsByFacilityServiceProvider]
	@InputFacility VARCHAR(50),
	@InputService VARCHAR(50),
	@InputProvider VARCHAR(50),
	@InputStart DateTime,
	@InputEnd DateTime
AS	
	SELECT   Alerts$.STATION_DATETIME_ALERTID, Alerts$.ALERTID, Alerts$.DATETIME1, Alerts$.FACILITYNAME, Alerts$.SERVICE1, Alerts$.ORDERINGPROVIDER, 
                         Alerts$.ALERTRECIPIENTS, Alerts$.SPARE, Alerts$.ALERTCATEGORY, Alerts$.ALERTTYPE, Alerts$.VALUE1, Alerts$.UNACKSTATUS, Alerts$.ACKRENEWDATE, 
                         Alerts$.DELETEDATE, Alerts$.FATSTATUS, Alerts$.FATPROVIDER, Alerts$.FOLLOW_UPPROVIDERID, Alerts$.CLINIC, Alerts$.PATIENTID, Alerts$.ALERTRESULTOR, 
                         Alerts$.RESULTORPERSONCLASS, Alerts$.ALERTTYPEORIGSTATION, CASE WHEN Alerts$.ACKGT7D = 1 THEN ''Yes'' ELSE ''No'' END AS ACKGT7D, 
                         CASE WHEN Alerts$.FOLLOWUPGT7D = 1 THEN ''Yes'' ELSE ''No'' END AS FOLLOWUPGT7D, 
                         CASE WHEN Alerts$.FOLLOWUPLT7D = 1 THEN ''Yes'' ELSE ''No'' END AS FOLLOWUPLT7D, Followups$.STATION_DATETIME_ALERTID AS Expr1, 
                         Followups$.FOLLOWUP, Followups$.FOLLOWUPDATETIME
	FROM Alerts$ LEFT OUTER JOIN Followups$ ON Alerts$.STATION_DATETIME_ALERTID = Followups$.STATION_DATETIME_ALERTID	
	WHERE Alerts$.FACILITYNAME = @InputFacility and Alerts$.SERVICE1 = @InputService and Alerts$.ORDERINGPROVIDER = @InputProvider 
		and Alerts$.DATETIME1 >= @InputStart and Alerts$.DATETIME1 < DATEADD(day,1,@InputEnd)







' 
END
GO
/****** Object:  StoredProcedure [dbo].[usp_Report_GetAlertsWithFollowupsByFacilityServiceClinicProviderAlterType]    Script Date: 05/06/2014 14:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Report_GetAlertsWithFollowupsByFacilityServiceClinicProviderAlterType]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE PROCEDURE [dbo].[usp_Report_GetAlertsWithFollowupsByFacilityServiceClinicProviderAlterType]
	@InputFacility VARCHAR(50),
	@InputService VARCHAR(50),
	@InputClinic VARCHAR(50),
	@InputProvider VARCHAR(50),
	@InputAlertType VARCHAR(50),
	@InputStart DateTime,
	@InputEnd DateTime
AS	
	SELECT   Alerts$.STATION_DATETIME_ALERTID, Alerts$.ALERTID, Alerts$.DATETIME1, Alerts$.FACILITYNAME, Alerts$.SERVICE1, Alerts$.ORDERINGPROVIDER, 
                         Alerts$.ALERTRECIPIENTS, Alerts$.SPARE, Alerts$.ALERTCATEGORY, Alerts$.ALERTTYPE, Alerts$.VALUE1, Alerts$.UNACKSTATUS, Alerts$.ACKRENEWDATE, 
                         Alerts$.DELETEDATE, Alerts$.FATSTATUS, Alerts$.FATPROVIDER, Alerts$.FOLLOW_UPPROVIDERID, Alerts$.CLINIC, Alerts$.PATIENTID, Alerts$.ALERTRESULTOR, 
                         Alerts$.RESULTORPERSONCLASS, Alerts$.ALERTTYPEORIGSTATION, CASE WHEN Alerts$.ACKGT7D = 1 THEN ''Yes'' ELSE ''No'' END AS ACKGT7D, 
                         CASE WHEN Alerts$.FOLLOWUPGT7D = 1 THEN ''Yes'' ELSE ''No'' END AS FOLLOWUPGT7D, 
                         CASE WHEN Alerts$.FOLLOWUPLT7D = 1 THEN ''Yes'' ELSE ''No'' END AS FOLLOWUPLT7D, Followups$.STATION_DATETIME_ALERTID AS Expr1, 
                         Followups$.FOLLOWUP, Followups$.FOLLOWUPDATETIME
	FROM Alerts$ LEFT OUTER JOIN Followups$ ON Alerts$.STATION_DATETIME_ALERTID = Followups$.STATION_DATETIME_ALERTID	
	WHERE Alerts$.FACILITYNAME = @InputFacility and Alerts$.SERVICE1 = @InputService 
		and Alerts$.CLINIC = @InputClinic and Alerts$.ORDERINGPROVIDER = @InputProvider 
		and Alerts$.ALERTTYPE = @InputAlertType
		and Alerts$.DATETIME1 >= @InputStart and Alerts$.DATETIME1 < DATEADD(day,1,@InputEnd)








' 
END
GO
/****** Object:  StoredProcedure [dbo].[usp_Report_GetAlertsWithFollowupsByFacilityServiceClinicProvider]    Script Date: 05/06/2014 14:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Report_GetAlertsWithFollowupsByFacilityServiceClinicProvider]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

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
                         Alerts$.RESULTORPERSONCLASS, Alerts$.ALERTTYPEORIGSTATION, CASE WHEN Alerts$.ACKGT7D = 1 THEN ''Yes'' ELSE ''No'' END AS ACKGT7D, 
                         CASE WHEN Alerts$.FOLLOWUPGT7D = 1 THEN ''Yes'' ELSE ''No'' END AS FOLLOWUPGT7D, 
                         CASE WHEN Alerts$.FOLLOWUPLT7D = 1 THEN ''Yes'' ELSE ''No'' END AS FOLLOWUPLT7D, Followups$.STATION_DATETIME_ALERTID AS Expr1, 
                         Followups$.FOLLOWUP, Followups$.FOLLOWUPDATETIME
	FROM Alerts$ LEFT OUTER JOIN Followups$ ON Alerts$.STATION_DATETIME_ALERTID = Followups$.STATION_DATETIME_ALERTID	
	WHERE Alerts$.FACILITYNAME = @InputFacility and Alerts$.SERVICE1 = @InputService 
		and Alerts$.CLINIC = @InputClinic and Alerts$.ORDERINGPROVIDER = @InputProvider 
		and Alerts$.DATETIME1 >= @InputStart and Alerts$.DATETIME1 < DATEADD(day,1,@InputEnd)








' 
END
GO
/****** Object:  StoredProcedure [dbo].[usp_Report_GetAlertsWithFollowupsByFacilityProvider]    Script Date: 05/06/2014 14:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Report_GetAlertsWithFollowupsByFacilityProvider]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE PROCEDURE [dbo].[usp_Report_GetAlertsWithFollowupsByFacilityProvider]
	@InputFacility VARCHAR(50),
	@InputProvider VARCHAR(50),
	@InputStart DateTime,
	@InputEnd DateTime
AS	
	SELECT   Alerts$.STATION_DATETIME_ALERTID, Alerts$.ALERTID, Alerts$.DATETIME1, Alerts$.FACILITYNAME, Alerts$.SERVICE1, Alerts$.ORDERINGPROVIDER, 
                         Alerts$.ALERTRECIPIENTS, Alerts$.SPARE, Alerts$.ALERTCATEGORY, Alerts$.ALERTTYPE, Alerts$.VALUE1, Alerts$.UNACKSTATUS, Alerts$.ACKRENEWDATE, 
                         Alerts$.DELETEDATE, Alerts$.FATSTATUS, Alerts$.FATPROVIDER, Alerts$.FOLLOW_UPPROVIDERID, Alerts$.CLINIC, Alerts$.PATIENTID, Alerts$.ALERTRESULTOR, 
                         Alerts$.RESULTORPERSONCLASS, Alerts$.ALERTTYPEORIGSTATION, CASE WHEN Alerts$.ACKGT7D = 1 THEN ''Yes'' ELSE ''No'' END AS ACKGT7D, 
                         CASE WHEN Alerts$.FOLLOWUPGT7D = 1 THEN ''Yes'' ELSE ''No'' END AS FOLLOWUPGT7D, 
                         CASE WHEN Alerts$.FOLLOWUPLT7D = 1 THEN ''Yes'' ELSE ''No'' END AS FOLLOWUPLT7D, Followups$.STATION_DATETIME_ALERTID AS Expr1, 
                         Followups$.FOLLOWUP, Followups$.FOLLOWUPDATETIME
	FROM Alerts$ LEFT OUTER JOIN Followups$ ON Alerts$.STATION_DATETIME_ALERTID = Followups$.STATION_DATETIME_ALERTID	
	WHERE Alerts$.FACILITYNAME = @InputFacility and Alerts$.ORDERINGPROVIDER = @InputProvider 
		and Alerts$.DATETIME1 >= @InputStart and Alerts$.DATETIME1 < DATEADD(day,1,@InputEnd)





' 
END
GO
/****** Object:  StoredProcedure [dbo].[usp_Report_GetAlertsByFacilitySProvider]    Script Date: 05/06/2014 14:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Report_GetAlertsByFacilitySProvider]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[usp_Report_GetAlertsByFacilitySProvider]
	@InputFacility VARCHAR(50),
	@InputProvider VARCHAR(50),
	@InputStart DateTime,
	@InputEnd DateTime
AS	
	SELECT STATION_DATETIME_ALERTID,ALERTID,DATETIME1,FACILITYNAME,SERVICE1,ORDERINGPROVIDER, 
                        ALERTRECIPIENTS,SPARE,ALERTCATEGORY,ALERTTYPE,VALUE1,UNACKSTATUS,ACKRENEWDATE, 
                        DELETEDATE,FATSTATUS,FATPROVIDER,FOLLOW_UPPROVIDERID,CLINIC,PATIENTID,ALERTRESULTOR, 
                        RESULTORPERSONCLASS,ALERTTYPEORIGSTATION, CASE WHEN ACKGT7D = 1 THEN ''Yes'' ELSE ''No'' END AS ACKGT7D, 
                         CASE WHEN FOLLOWUPGT7D = 1 THEN ''Yes'' ELSE ''No'' END AS FOLLOWUPGT7D, 
                         CASE WHEN FOLLOWUPLT7D = 1 THEN ''Yes'' ELSE ''No'' END AS FOLLOWUPLT7D
	FROM Alerts$
	WHERE FACILITYNAME = @InputFacility and ORDERINGPROVIDER = @InputProvider 
		and DATETIME1 >= @InputStart and DATETIME1 < DATEADD(day,1,@InputEnd)




' 
END
GO
/****** Object:  StoredProcedure [dbo].[usp_Report_GetAlertsByFacilityServiceProvider]    Script Date: 05/06/2014 14:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Report_GetAlertsByFacilityServiceProvider]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE PROCEDURE [dbo].[usp_Report_GetAlertsByFacilityServiceProvider]
	@InputFacility VARCHAR(50),
	@InputService VARCHAR(50),
	@InputProvider VARCHAR(50),
	@InputStart DateTime,
	@InputEnd DateTime
AS	
	SELECT STATION_DATETIME_ALERTID,ALERTID,DATETIME1,FACILITYNAME,SERVICE1,ORDERINGPROVIDER, 
                        ALERTRECIPIENTS,SPARE,ALERTCATEGORY,ALERTTYPE,VALUE1,UNACKSTATUS,ACKRENEWDATE, 
                        DELETEDATE,FATSTATUS,FATPROVIDER,FOLLOW_UPPROVIDERID,CLINIC,PATIENTID,ALERTRESULTOR, 
                        RESULTORPERSONCLASS,ALERTTYPEORIGSTATION, CASE WHEN ACKGT7D = 1 THEN ''Yes'' ELSE ''No'' END AS ACKGT7D, 
                         CASE WHEN FOLLOWUPGT7D = 1 THEN ''Yes'' ELSE ''No'' END AS FOLLOWUPGT7D, 
                         CASE WHEN FOLLOWUPLT7D = 1 THEN ''Yes'' ELSE ''No'' END AS FOLLOWUPLT7D
	FROM Alerts$
	WHERE FACILITYNAME = @InputFacility and SERVICE1 = @InputService and ORDERINGPROVIDER = @InputProvider 
		and DATETIME1 >= @InputStart and DATETIME1 < DATEADD(day,1,@InputEnd)



' 
END
GO
/****** Object:  StoredProcedure [dbo].[usp_Report_GetAlertsByFacilityServiceClinicProvider]    Script Date: 05/06/2014 14:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Report_GetAlertsByFacilityServiceClinicProvider]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE PROCEDURE [dbo].[usp_Report_GetAlertsByFacilityServiceClinicProvider]
	@InputFacility VARCHAR(50),
	@InputService VARCHAR(50),
	@InputClinic VARCHAR(50),
	@InputProvider VARCHAR(50),
	@InputStart DateTime,
	@InputEnd DateTime
AS	
	SELECT STATION_DATETIME_ALERTID,ALERTID,DATETIME1,FACILITYNAME,SERVICE1,ORDERINGPROVIDER, 
                        ALERTRECIPIENTS,SPARE,ALERTCATEGORY,ALERTTYPE,VALUE1,UNACKSTATUS,ACKRENEWDATE, 
                        DELETEDATE,FATSTATUS,FATPROVIDER,FOLLOW_UPPROVIDERID,CLINIC,PATIENTID,ALERTRESULTOR, 
                        RESULTORPERSONCLASS,ALERTTYPEORIGSTATION, CASE WHEN ACKGT7D = 1 THEN ''Yes'' ELSE ''No'' END AS ACKGT7D, 
                         CASE WHEN FOLLOWUPGT7D = 1 THEN ''Yes'' ELSE ''No'' END AS FOLLOWUPGT7D, 
                         CASE WHEN FOLLOWUPLT7D = 1 THEN ''Yes'' ELSE ''No'' END AS FOLLOWUPLT7D
	FROM Alerts$
	WHERE FACILITYNAME = @InputFacility and SERVICE1 = @InputService and CLINIC = @InputClinic
		and ORDERINGPROVIDER = @InputProvider and DATETIME1 >= @InputStart and DATETIME1 < DATEADD(day,1,@InputEnd)



' 
END
GO
/****** Object:  StoredProcedure [dbo].[usp_Report_GetAlertsByFacilityServiceClinic]    Script Date: 05/06/2014 14:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Report_GetAlertsByFacilityServiceClinic]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE PROCEDURE [dbo].[usp_Report_GetAlertsByFacilityServiceClinic]
	@InputFacility VARCHAR(50),
	@InputService VARCHAR(50),
	@InputClinic VARCHAR(50),
	@InputStart DateTime,
	@InputEnd DateTime
AS	
	SELECT STATION_DATETIME_ALERTID,ALERTID,DATETIME1,FACILITYNAME,SERVICE1,ORDERINGPROVIDER, 
                        ALERTRECIPIENTS,SPARE,ALERTCATEGORY,ALERTTYPE,VALUE1,UNACKSTATUS,ACKRENEWDATE, 
                        DELETEDATE,FATSTATUS,FATPROVIDER,FOLLOW_UPPROVIDERID,CLINIC,PATIENTID,ALERTRESULTOR, 
                        RESULTORPERSONCLASS,ALERTTYPEORIGSTATION, CASE WHEN ACKGT7D = 1 THEN ''Yes'' ELSE ''No'' END AS ACKGT7D, 
                         CASE WHEN FOLLOWUPGT7D = 1 THEN ''Yes'' ELSE ''No'' END AS FOLLOWUPGT7D, 
                         CASE WHEN FOLLOWUPLT7D = 1 THEN ''Yes'' ELSE ''No'' END AS FOLLOWUPLT7D
	FROM Alerts$
	WHERE FACILITYNAME = @InputFacility and SERVICE1 = @InputService and CLINIC = @InputClinic
		and DATETIME1 >= @InputStart and DATETIME1 < DATEADD(day,1,@InputEnd)


' 
END
GO
/****** Object:  StoredProcedure [dbo].[usp_Report_GetAlertsByFacilityService]    Script Date: 05/06/2014 14:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Report_GetAlertsByFacilityService]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE PROCEDURE [dbo].[usp_Report_GetAlertsByFacilityService]
	@InputFacility VARCHAR(50),
	@InputService VARCHAR(50),
	@InputStart DateTime,
	@InputEnd DateTime
AS	
	SELECT STATION_DATETIME_ALERTID,ALERTID,DATETIME1,FACILITYNAME,SERVICE1,ORDERINGPROVIDER, 
                        ALERTRECIPIENTS,SPARE,ALERTCATEGORY,ALERTTYPE,VALUE1,UNACKSTATUS,ACKRENEWDATE, 
                        DELETEDATE,FATSTATUS,FATPROVIDER,FOLLOW_UPPROVIDERID,CLINIC,PATIENTID,ALERTRESULTOR, 
                        RESULTORPERSONCLASS,ALERTTYPEORIGSTATION, CASE WHEN ACKGT7D = 1 THEN ''Yes'' ELSE ''No'' END AS ACKGT7D, 
                         CASE WHEN FOLLOWUPGT7D = 1 THEN ''Yes'' ELSE ''No'' END AS FOLLOWUPGT7D, 
                         CASE WHEN FOLLOWUPLT7D = 1 THEN ''Yes'' ELSE ''No'' END AS FOLLOWUPLT7D
	FROM Alerts$
	WHERE FACILITYNAME = @InputFacility and SERVICE1 = @InputService
		and DATETIME1 >= @InputStart and DATETIME1 < DATEADD(day,1,@InputEnd)


' 
END
GO
/****** Object:  StoredProcedure [dbo].[usp_Report_GetAlertsByFacility]    Script Date: 05/06/2014 14:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Report_GetAlertsByFacility]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE PROCEDURE [dbo].[usp_Report_GetAlertsByFacility]
	@InputFacility VARCHAR(50),
	@InputStart DateTime,
	@InputEnd DateTime
AS	
	SELECT STATION_DATETIME_ALERTID,ALERTID,DATETIME1,FACILITYNAME,SERVICE1,ORDERINGPROVIDER, 
                        ALERTRECIPIENTS,SPARE,ALERTCATEGORY,ALERTTYPE,VALUE1,UNACKSTATUS,ACKRENEWDATE, 
                        DELETEDATE,FATSTATUS,FATPROVIDER,FOLLOW_UPPROVIDERID,CLINIC,PATIENTID,ALERTRESULTOR, 
                        RESULTORPERSONCLASS,ALERTTYPEORIGSTATION, CASE WHEN ACKGT7D = 1 THEN ''Yes'' ELSE ''No'' END AS ACKGT7D, 
                         CASE WHEN FOLLOWUPGT7D = 1 THEN ''Yes'' ELSE ''No'' END AS FOLLOWUPGT7D, 
                         CASE WHEN FOLLOWUPLT7D = 1 THEN ''Yes'' ELSE ''No'' END AS FOLLOWUPLT7D
	FROM Alerts$
	WHERE FACILITYNAME = @InputFacility 
		and DATETIME1 >= @InputStart and DATETIME1 < DATEADD(day,1,@InputEnd)


' 
END
GO
