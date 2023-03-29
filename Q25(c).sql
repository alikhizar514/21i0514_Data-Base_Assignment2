
select SRECORD.s_date,SRECORD.s_hours,count(*)as no_of_service from SRecord where (DATEPART(mm, GETdate()-2)) = (
 DATEPART(month,SRecord.s_date)) GROUP BY SRECORD.s_hours,SRECORD.s_date
 HAVING SRecord.s_hours = (SELECT MAX(SRECORD.s_hours) FROM SRECORD WHERE (DATEPART(mm, GETdate()-2)) = (
 DATEPART(month,SRecord.s_date)) )
