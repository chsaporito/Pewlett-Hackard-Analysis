--Deliverable 1: The Number of Retiring Employees by Title

--Creating retirement_titles table to export to retirement_titles.csv
--retirement_titles table holds all the titles of employees who were born between January 1, 1952 and December 31, 1955. 
SELECT 
	e.emp_no,
	e.first_name,
	e.last_name,
	t.title,
	t.from_date,
	t.to_date
INTO retirement_titles
FROM employees e
join titles t on e.emp_no = t.emp_no
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
order by e.emp_no;

-- unique_titles table contains the most recent title of each employee.
SELECT DISTINCT ON (emp_no) emp_no,
	first_name,
	last_name,
	title
INTO unique_titles
FROM retirement_titles
WHERE to_date = '9999-01-01'
ORDER BY emp_no, to_date DESC;

--retiring_titles table holds the number of employees by their most recent job title who are about to retire
SELECT 
	COUNT(title) 
	,title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY COUNT DESC;

--Deliverable 2: The Employees Eligible for the Mentorship Program

select DISTINCT ON (e.emp_no)
	e.emp_no, 
	e.first_name, 
	e.last_name, 
	e.birth_date,
	de.from_date,
	de.to_date,
	t.title
INTO mentorship_eligibilty
from employees e
join dept_emp de on de.emp_no =e.emp_no
join titles t on t.emp_no =e.emp_no
WHERE t.to_date = '9999-01-01'
AND e.birth_date BETWEEN '1965-01-01' AND '1965-12-31'
order by e.emp_no ;










