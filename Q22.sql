


Select Employees.shift_type,Avg(Employees.salary) As Average_Salary 
from Employees 
where Employees.shift_type In (0,1)
group by Employees.shift_type;
