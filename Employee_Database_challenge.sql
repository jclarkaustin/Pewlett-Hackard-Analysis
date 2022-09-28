--Steps 1-7
SELECT Employees.emp_no,
employees.first_name,
Employees.last_name,
Titles.title,
Titles.from_date,
Titles.to_date
INTO retirement_titles
FROM Employees INNER JOIN Titles ON Employees.emp_no = Titles.emp_no
WHERE (((Employees.birth_date) BETWEEN '1/1/1952' AND '12/31/1955'))
ORDER BY emp_no;

--Steps 8-15
SELECT DISTINCT ON (Employees.emp_no) Employees.emp_no,
employees.first_name,
Employees.last_name,
Titles.title
INTO unique_titles
FROM Employees INNER JOIN Titles ON Employees.emp_no = Titles.emp_no
WHERE (((Titles.to_date)='9999-01-01') AND ((Employees.birth_date) BETWEEN '1/1/1952' AND '12/31/1955'))
ORDER BY Employees.emp_no;

--Steps 16-21
SELECT unique_titles.title, COUNT(unique_titles.title) AS CountofTitle
INTO retiring_titles
FROM unique_titles
GROUP BY unique_titles.title
ORDER BY CountofTitle DESC;

-- Deliverable 2 Setps 1-11
SELECT DISTINCT ON (Employees.emp_no) Employees.emp_no,
employees.first_name,
Employees.last_name,
Employees.birth_date,
Titles.title
INTO mentorship_eligibility
FROM Employees INNER JOIN Titles ON Employees.emp_no = Titles.emp_no
WHERE (((Employees.birth_date) BETWEEN '1/1/1965' AND '12/31/1965'));