Select Powner.oname,Powner.oAddress,pmd.Model_Number from Powner
inner join bought_from  as bf_temp on bf_temp.Owner_id = Powner.Owner_id
inner join POwns as pown_temp on (bf_temp.Owner_id = pown_temp.Owner_id)
inner join Airplane on (Airplane.RegNumber = pown_temp.RegNumber)
inner join Ptype as pmd on (Airplane.Model_Number = pmd.Model_Number)
where pmd.Model_Number in 
(Select Ptype.Model_Number from 
POwns  inner join Airplane on Airplane.RegNumber = POwns.RegNumber
inner join Ptype on Ptype.Model_Number = Airplane.Model_Number
where ( POwns.Owner_id = bf_temp.owner2) And ((DATEPART(mm, GETDATE()) - 1 ) = (
 DATEPART(month,pown_temp.purchase_date))) AND ( DATEPART(year,pown_temp.purchase_date) = DATEPART(year,pown_temp.purchase_date)));
