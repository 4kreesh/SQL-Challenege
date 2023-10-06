--1
select e.emp_no,e.first_name, e.last_name,e.sex, s.salary
from employees as e
inner join salaries as s
on e.emp_no = s.emp_no
order by e.emp_no;
--2
select first_name, last_name, hire_date
from employees
where hire_date < '1987-01-01' and hire_date >='1986-01-01' 
order by hire_date asc;
--or
SELECT E.first_name, E.last_name, E.hire_date
FROM Employees AS E
WHERE EXTRACT(YEAR FROM hire_date) = 1986;

--3
select d.dept_no, d1.dept_name, e.emp_no, e.last_name, e.first_name, t.title
from employees as e
inner join dept_manager as d
on d.emp_no = e.emp_no
inner join departments as d1
on d1.dept_no = d.dept_no
inner join titles as t
on t.title_id = e.emp_title_id;

--4
select d1.dept_no, e.emp_no, e.last_name, e.first_name, d.dept_name
from employees e
inner join dept_emp d1
on d1.emp_no = e.emp_no
inner join departments d
on d.dept_no = d1.dept_no;


--5 
select first_name, last_name, sex
from employees
where first_name = 'Hercules' and last_name like 'B%';

--6
select e.emp_no, e.first_name, e.last_name
from employees as e
where emp_no in
(
select d1.emp_no
	from departments as d
	inner join dept_emp as d1
	on d1.dept_no = d.dept_no
	where d.dept_name = 'Sales'
);

--7 
select e.emp_no, e.first_name, e.last_name, d.dept_name
from employees as e
inner join dept_emp as d1
on d1.emp_no = e.emp_no
inner join departments as d
on d.dept_no = d1.dept_no
where d.dept_name = 'Sales' or d.dept_name ='Development'
;
	
--8 
select last_name, count(last_name)
from employees
group by last_name
order by count(last_name) desc;