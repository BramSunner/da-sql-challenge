-- 1. List the employee number, last name, first name, sex, and salary of each employee.
SELECT
	emp.emp_no, emp.last_name, emp.first_name, emp.sex, wage.salary
FROM
	emp
JOIN 
	wage ON emp.emp_no = wage.emp_no;

-- 2. List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT 	
	first_name, last_name, hire_date
FROM 	
	emp
WHERE 	
	hire_date BETWEEN '$1986-01-01' AND '$1986-12-31';

-- 3. List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT
	dept.dept_no, dept.dept_name, emp.emp_no, emp.last_name, emp.first_name
FROM 
	dept_mgr as d
JOIN
	dept ON d.dept_no = dept.dept_no
JOIN	
	emp ON d.emp_no = emp.emp_no;

-- 4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT
	dept.dept_no, dept.dept_name, emp.emp_no, emp.last_name, emp.first_name
FROM 
	dept_emp as d
JOIN
	dept ON d.dept_no = dept.dept_no
JOIN	
	emp ON d.emp_no = emp.emp_no;

-- 5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT
	first_name, last_name, sex
FROM
	emp
WHERE
	first_name = 'Hercules' AND last_name LIKE 'B%';

-- 6. List each employee in the Sales department, including their employee number, last name, and first name.
SELECT
	emp_no, last_name, first_name
FROM 
	emp
WHERE 
	emp_no IN 
(
	SELECT 
		emp_no
	FROM 
		dept_emp
	WHERE
		dept_no IN 
	(
		SELECT
			dept_no
		FROM
			dept
		WHERE
			dept_name = 'Sales'
	)
);

-- 7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT
	emp.emp_no, emp.last_name, emp.first_name, dept.dept_name
FROM
	dept_emp as d
JOIN
	emp ON d.emp_no = emp.emp_no
JOIN
	dept on d.dept_no = dept.dept_no
WHERE
	dept.dept_name = 'Sales' OR dept.dept_name = 'Development';

-- 8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT DISTINCT
	last_name, COUNT(last_name) as "Count of Last Name"
FROM
	emp
GROUP BY
	last_name
ORDER BY
	"Count of Last Name" DESC;