Select Powner.oname,Count(*) As Total_Planes
from Powner 
inner join POwns on (Powner.Owner_id = POwns.Owner_id)
group by Powner.oname;
