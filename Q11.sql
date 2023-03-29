Select Powner.oname,Count(*) As PCount from Powner 
Inner Join POwns on ( Powner.Owner_id = POwns.Owner_id)
group by Powner.oname
order by PCount desc;
