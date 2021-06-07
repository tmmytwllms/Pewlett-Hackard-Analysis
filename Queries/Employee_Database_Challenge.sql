--Create the retirement_titles table
SELECT e.emp_no,e.first_name,e.last_name,t.title,t.from_date,t.to_date
INTO retirement_titles
FROM Employees as e
JOIN titles as t
ON e.emp_no=t.emp_no
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no, to_date DESC;

--Create retiring titles table by retrieving number of unique titles
SELECT COUNT(title) as "count", title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY 1 DESC;

--Create a table to determine which employees are eligible for the mentorship program
SELECT DISTINCT ON (e.emp_no) e.emp_no, e.first_name, e.last_name, e.birth_date,de.from_date,de.to_date,t.title
INTO mentorship_eligibility
FROM employees as e
JOIN dept_emp as de
	ON e.emp_no=de.emp_no
JOIN titles as t
	ON e.emp_no=t.emp_no
