select employees.emp_shift ,count(*),avg(salary) as avg_sal 
from Employees where employees.salary > (select avg(employees.salary) from Employees)
group by employees.emp_shift
