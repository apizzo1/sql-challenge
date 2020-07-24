--DATA ANALYSIS
-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.

--reference the columns that will appear in final output
select a.emp_no, a.last_name, a.first_name, a.sex, b.salary
-- call first table that has needed information and join with second table containing needed information
from employees as a
--left join to ensure all employees have a salary output
--left join may be better than inner to potentially identify employees that have 'null' for salary 
--left join will not drop any employee rows in case salaries table does not have a emp_no match
	left join salaries as b
	on a.emp_no = b.emp_no;


--2. List first name, last name, and hire date for employees who were hired in 1986.
--source for formatting date output: https://www.postgresqltutorial.com/postgresql-date/#:~:text=Introduction%20to%20the%20PostgreSQL%20DATE%20data%20type&text=The%20lowest%20and%20highest%20values,%2C%202000%2D12%2D31

select first_name, last_name, TO_CHAR(hire_date:: DATE, 'mm/dd/yyyy')
from employees
--return all dates between 12/31/1985 and 1/1/1987 exclusive
where hire_date > '1985-12-31'
	and hire_date<'1987-01-01';


--3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
select d.dept_no, e.dept_name, d.manager_emp_no, f.last_name, f.first_name
from dept_manager as d
	inner join departments as e
		on d.dept_no = e.dept_no
	inner join employees as f
		on d.manager_emp_no = f.emp_no;
		

--4. List the department of each employee with the following information: employee number, last name, first name, and department name.
select a.emp_no, a.last_name, a.first_name, c.dept_name
from employees as a
	left join dept_emp as b
		on a.emp_no = b.emp_no
	left join departments as c
		on b.dept_no = c.dept_no;
		
--5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
select first_name, last_name, sex
from employees
where first_name = 'Hercules'
--using '%' operator to return all last names beginning with 'B'
	and last_name like 'B%';
	
--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
select a.emp_no, a.last_name, a.first_name, c.dept_name
from employees as a
	inner join dept_emp as b
		on a.emp_no = b.emp_no
	inner join departments as c
		on b.dept_no = c.dept_no
	where c.dept_name = 'Sales';
	
--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
select a.emp_no, a.last_name, a.first_name, c.dept_name
from employees as a
	inner join dept_emp as b
		on a.emp_no = b.emp_no
	inner join departments as c
		on b.dept_no = c.dept_no
	where c.dept_name = 'Sales'
		or c.dept_name = 'Development';
		
--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
select 
	last_name,
	--get the count of each last name and specify this in the group by statement below
	count(last_name) as "last_name_count"
from employees
group by last_name
--order by new column (last name count) and arrange in descending order
order by last_name_count desc;
