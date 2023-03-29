SELECT Powner.oname,Powner.ophone
FROM Powner
Join POwns on (POwns.Owner_id = Powner.Owner_id)
WHERE (DATEPART(mm, GETDATE()) - 1 ) = (
 DATEPART(month,POwns.purchase_date));
