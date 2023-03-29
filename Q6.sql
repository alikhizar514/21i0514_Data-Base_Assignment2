SELECT TOP(5)  e.Emp_id,e.salary,e.emp_shift,e.shift_type,m.sr_number,m.Total_hours FROM Employees e
Inner Join Maintain m on ( e.Emp_id = m.Emp_id )
Order By m.Total_hours DESC;
