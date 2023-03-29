Select Airplane.RegNumber, Count(*)
from Airplane
Inner join  Pservice on Pservice.RegNumber = Airplane.RegNumber
group by Airplane.RegNumber;
