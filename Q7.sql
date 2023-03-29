SELECT Airplane.RegNumber
FROM Airplane
Join Pservice on (Pservice.RegNumber = Airplane.RegNumber)
Join SRecord  on  (Pservice.sr_number = SRecord.sr_number)
WHERE 
( (DATEPART(dAy,SRecord.s_date)) > (DATEPART(dAy, GETDATE()) - 7) ) And
( (DATEPART(dAy,SRecord.s_date)) < (DATEPART(dAy, GETDATE()) + 7) ) And 
( (DATEPART(month,SRecord.s_date)) = (DATEPART(month, GETDATE())) );
