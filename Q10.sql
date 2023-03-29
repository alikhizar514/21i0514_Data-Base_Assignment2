Select Hanger.hlocation ,Hanger.hcapacity from Hanger where 
Hanger.hcapacity = (
Select Max(Hanger.hcapacity) from  Hanger
);
