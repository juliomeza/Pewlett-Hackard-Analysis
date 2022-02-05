-- DELIVERABLE 1 --
-------------------
-- Employees
select emp_no, first_name, last_name, birth_date
from employees

-- Titles
select title, from_date, to_date
from titles

-- Employees and Titles
SELECT	e.emp_no, e.first_name, e.last_name,
		t.title, t.from_date, t.to_date
--INTO retirement_titles
FROM employees e
	JOIN titles t
		ON t.emp_no = e.emp_no
WHERE e.birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY e.emp_no

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no, first_name, last_name, title
--INTO unique_titles
FROM retirement_titles
WHERE to_date = '9999-01-01'
ORDER BY emp_no, from_date DESC;

-- Retiring Titles
SELECT COUNT (title) count, title
--INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY count DESC


-- DELIVERABLE 2 --
-------------------

-- Employees
SELECT emp_no, first_name, last_name, birth_date
FROM employees

-- Department Employee
SELECT from_date, to_date
FROM dept_emp

-- Title
SELECT title
FROM titles

-- Join Tables
SELECT DISTINCT ON	(e.emp_no) e.emp_no, e.first_name, e.last_name, e.birth_date,
					de.from_date, de.to_date,
					t.title
--INTO mentorship_eligibilty
FROM employees e
	JOIN dept_emp de ON de.emp_no = e.emp_no
	JOIN titles t ON t.emp_no = e.emp_no
WHERE	t.to_date = '9999-01-01'
		AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no, t.from_date DESC

-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------

-- For the Readme File

select t.title, count (t.title) count
from current_emp ce
	join titles t on t.emp_no = ce.emp_no
group by t.title

select DISTINCT ON (emp_no) emp_no, title
from titles
order by emp_no, from_date DESC

-----------------------------------------------------------------------------------
-- Current Employees by Title
select ut.title, count(ut.title) count
from employees e
	JOIN	(select DISTINCT ON (emp_no) emp_no, title
			from titles t
			where to_date = '9999-01-01'
			order by emp_no, from_date DESC) ut
				on (ut.emp_no = e.emp_no)
group by ut.title
order by ut.title

-----------------------------------------------------------------------------------

select distinct e.emp_no
from employees e
	left join titles t on t.emp_no=e.emp_no
where t.to_date = '9999-01-01'

