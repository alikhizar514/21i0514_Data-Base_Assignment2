Select Pilot.Lic_Number ,Count(*) As Total_Planes

from Pilot 

group by Pilot.Lic_Number;
