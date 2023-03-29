Select Powner.oname,Powner.ophone from Powner
join POwns pr on Powner.Owner_id = pr.Owner_id 
join bought_from on bought_from.Owner_id = pr.Owner_id
join Airplane on Airplane.RegNumber = pr.RegNumber
join Hanger hr on hr.Hanger_Number = Airplane.Hanger_Number
where hr.hlocation in 
( Select hr1.hlocation from POwns as pr1 
join Airplane Ar on Ar.RegNumber = pr1.RegNumber 
join Hanger hr1 on hr1.Hanger_Number = Ar.Hanger_Number
where pr1.Owner_id = bought_from.owner2);
