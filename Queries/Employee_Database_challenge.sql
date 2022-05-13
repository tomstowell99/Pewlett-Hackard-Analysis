

--Tom Stowell Module challenge #7. 5-7-2-22
-- Deliveralbes
--			1. number of retiring Employees by title
-- 			2. Employees eligible for mentorship program
--			3. final written report




--Number of Retiring Employees--
-- query to create retirement titles table for employess who are born between 1-1-52 and 12-31-55
SELECT e.emp_no, first_name, last_name, title, from_date, to_date 

Into retirement_titles
From
	employees e LEFT JOIN
	titles t
	on e.emp_no = t.emp_no
	
Where birth_date >= '01/01/1952' and birth_date <= '12/31/1955' 
order by e.emp_no




-- Use Dictinct with Orderby to remove duplicate rows
--query to create unique titles table that contains the employee nubmer, first and last name and most recent title.

SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title

INTO unique_titles
FROM retirement_titles
WHERE to_date = '9999-01-01'
ORDER BY emp_no, to_date DESC;


--Query is wriiten and executed to create a retiring titles table that contains the number of titles filled by employees who are retiring


SELECT count (title) as count, title
into retiring_titles	
from unique_titles
group by title
order by  count desc 


-- Mentorship Eligibility Deliverable #2


SELECT DISTINCT ON (e.emp_no) e.emp_no, 
	 
	e.first_name, 
	e.last_name, 
	e.birth_date, 
	d.from_date, 
	d.to_date,
	t.title
	
INTO mentorship_eligibilty
From
	employees e
LEFT JOIN dept_emp d
	ON e.emp_no = d.emp_no
LEFT JOIN titles t
	ON e.emp_no = t.emp_no

Where 
	birth_date >= '01/01/1965'
	and birth_date <= '12/31/1965' 
	and d.to_date = '9999-01-01'
	-- this last where clause is the pull the last title they have.
	and t.to_date='9999-01-01'
order by e.emp_no


	