-- DELIVERABLE 1
-- Employees
select emp_no, first_name, last_name, birth_date
from employees

-- Titles
select title, from_date, to_date
from titles

-- Employees and Titles
SELECT	e.emp_no, e.first_name, e.last_name,
		t.title, t.from_date, t.to_date
INTO retirement_titles
FROM employees e
	JOIN titles t
		ON t.emp_no = e.emp_no
WHERE e.birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY e.emp_no

