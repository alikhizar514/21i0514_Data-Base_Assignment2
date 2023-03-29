select han.hcapacity,count(*) 
from howns h inner join powns p on h.owner_id=p.owner_id 
inner join Hanger han on han.Hanger_Number = h.Hanger_Number
group by han.hcapacity having han.hcapacity>5
