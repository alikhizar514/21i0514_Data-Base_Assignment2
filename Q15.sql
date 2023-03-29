Select Distinct Pilot.Pssn,Pilot.Lic_Number 
from Pilot
inner join Ptype    on (Ptype.Model_Number = Pilot.Model_Number)
inner join Airplane on (Airplane.Model_Number = Ptype.Model_Number)
inner join Pservice on (Airplane.RegNumber = Pservice.RegNumber AnD Pservice.Maintenance_status = 0);
