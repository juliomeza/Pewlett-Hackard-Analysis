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

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no, first_name, last_name, title
INTO unique_titles
FROM retirement_titles
WHERE to_date = '9999-01-01'
ORDER BY emp_no, from_date DESC;

-- Retiring Titles
SELECT COUNT (title) count, title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY count DESC
