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
SELECT DISTINCT ON (emp_no) 
	emp_no,
	first_name,
	last_name,
	title
INTO unique_titles
FROM retirement_titles
WHERE to_date = '9999-01-01'
ORDER BY emp_no, to_date DESC;

--retiring_titles table holds the number of employees by their most recent job title who are about to retire
SELECT 
	COUNT(title), 
	title
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
FROM employees e
JOIN dept_emp de on de.emp_no =e.emp_no
JOIN titles t on t.emp_no =e.emp_no
WHERE t.to_date = '9999-01-01'
AND e.birth_date BETWEEN '1965-01-01' AND '1965-12-31'
order by e.emp_no ;


--Additional queries
--compairing mentorships count to retiring_titles count
SELECT 
	COUNT(title), 
	title
FROM mentorship_eligibilty
GROUP BY title
ORDER BY COUNT DESC;

SELECT  
	r.title as "Retiring Title", 
	r.count, 
	COALESCE(m.title,r.title) as "Mentor Title", 
	COALESCE(m.count,0) 
FROM retiring_titles r
FULL OUTER JOIN mentorship_count m on m.title=r.title
ORDER BY r.count DESC

--create mentorship_count table
SELECT 
	COUNT(title) 
	,title
INTO mentorship_count
FROM mentorship_eligibilty 
GROUP BY title
ORDER BY COUNT DESC;

--create department_counts table
select  dept_no, Count(dept_no) as "Department Count" 
into department_counts
from dept_emp
where to_date='9999-01-01'
group by dept_no



select 
de.dept_no, 
dc.dept_count, 
count(de.dept_no) as "Retirement Count"
from dept_emp de
join  unique_titles ut on ut.emp_no = de.emp_no
join department_counts dc on dc.dept_no = de.dept_no
group by de.dept_no
