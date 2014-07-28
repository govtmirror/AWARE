SELECT     Dim.StopCode.StopCode, Dim.StopCode.Sta3n, Dim.StopCode.StopCodeName, Con.Consult.RequestDateTime, Con.Consult.RequestType, 
                      Con.Consult.DisplayTextOfItemOrdered, Con.Consult.InpatOutpat, Con.Consult.ProcedureRequestType, Con.Consult.Result, Con.Consult.Urgency, 
                      Dim.AssociatedStopCode.AssociatedStopCodeSID
FROM         Dim.StopCode INNER JOIN
                      Dim.AssociatedStopCode ON Dim.StopCode.StopCodeSID = Dim.AssociatedStopCode.StopCodeSID RIGHT OUTER JOIN
                      Con.Consult ON Dim.AssociatedStopCode.RequestServiceSID = Con.Consult.ToRequestServiceSID
WHERE     (Con.Consult.RequestDateTime > CONVERT(DATETIME, '2012-08-01 00:00:00', 102)) AND (Dim.StopCode.StopCode BETWEEN 500 AND 600)



select cc.consultSID , cc.RequestDateTime, da.StopCode, da.StopCodeSID,Nullcheck= ISNULL(stopcode,-999) 
From Con.Consult as cc left outer join 
     Dim.AssociatedStopCode as da on
     cc.ToRequestServiceSID= da.RequestServiceSID /*and da.StopCode between 500 and 600*/
WHERE     cc.RequestDateTime > '08/1/2012'
/*777160*/
select cc.consultSID , cc.RequestDateTime, da.StopCode, da.StopCodeSID
From Con.Consult as cc inner join 
     Dim.AssociatedStopCode as da on
     cc.ToRequestServiceSID= da.RequestServiceSID /*and da.StopCode between 500 and 600*/
WHERE     cc.RequestDateTime > '08/1/2012'
/*103948*/

select count(case when ISNULL(stopcode,-999) =-999 then 1 else 0 end) as nullcheck
From Con.Consult as cc left outer join 
     Dim.AssociatedStopCode as da on
     cc.ToRequestServiceSID= da.RequestServiceSID /*and da.StopCode between 500 and 600*/
WHERE     cc.RequestDateTime > '08/1/2012'

