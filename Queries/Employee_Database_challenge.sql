

--Tom Stowell Module challenge #7. 5-7-2-22
-- Deliveralbes
--			1. number of retiring Employees by title
-- 			2. Employees eligible for mentorship program
--			3. final written report




--Number of Retiring Employees--

SELECT e.emp_no, first_name, last_name, title, from_date, to_date 

Into retirement_titles
From
	employees e LEFT JOIN
	titles t
	on e.emp_no = t.emp_no
	
Where birth_date >= '01/01/1952' and birth_date <= '12/31/1955' 
order by e.emp_no
	

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title

INTO unique_titles
FROM retirement_titles
WHERE to_date = '9999-01-01'
ORDER BY emp_no, to_date DESC;

--Retrieve the number of employees by ther most recent job title who are about to retire from the unique titles table.



SELECT count (title) as count, title
into retiring_titles	
from unique_titles
group by title
order by  count desc 


	
	