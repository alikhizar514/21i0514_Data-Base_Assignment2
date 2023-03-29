Select Distinct Maintain.Total_hours,emp.Emp_id from Employees emp
join Maintain on Maintain.Emp_id = emp.Emp_id 
join Pservice on Pservice.sr_number = Maintain.sr_number
where emp.Emp_id in ( Select mn.Emp_id from Powner
join POwns on POwns.Owner_id = Powner.Owner_id
join Pservice psr on psr.RegNumber = POwns.RegNumber
join Maintain mn on mn.sr_number = psr.sr_number
where Powner.oname='Ali Khizar'
)
order by Maintain.Total_hours Asc;
;
