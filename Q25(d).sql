select top(5) Employees.Emp_id,maintain.Total_hours from employees inner join maintain on Maintain.Emp_id=employees.Emp_id
group by maintain.Total_hours,Employees.Emp_id order by  maintain.Total_hours desc
