Select Airplane.Model_Number, Count(*)
from Airplane
inner join Ptype on Airplane.Model_Number = Ptype.Model_Number
group by Airplane.Model_Number;
