Select Distinct Ap.RegNumber from Airplane Ap
where Ap.RegNumber not in( Select POwns.RegNumber from POwns) or (Ap.RegNumber in 
(Select Distinct Apr.RegNumber from Employees
 join Maintain on Maintain.Emp_id = Employees.Emp_id
 join Pservice on Pservice.sr_number = Maintain.sr_number
 join Airplane as Apr on Apr.RegNumber = Pservice.RegNumber 
 where Employees.shift_type=1));
