--List the following details of each employee: 
--employee number, last name, first name, gender, and salary

SELECT 
a.emp_no, a.last_name, a.first_name, a.gender
FROM
employees as a
INNER JOIN salaries
ON a.emp_no = salaries.emp_no;

--List employees who were hired in 1986.

SELECT 
emp_no, last_name, first_name, hire_date
FROM
employees
WHERE
hire_date BETWEEN '01/01/1986' and '12/31/1986';

--List the manager of each department with the following information: department number, 
--department name, the manager's employee number, last name, first name, and start and end 
--employment dates.

SELECT 
depts.dept_no, depts.dept_name, dm.emp_no, emps.last_name, emps.first_name, dm.from_date, dm.to_date
FROM
departments as depts
JOIN dept_mgr as dm
ON dm.dept_no=depts.dept_no
JOIN employees as emps
ON dm.emp_no=emps.emp_no
;

--List the department of each employee with the following information: 
--employee number, last name, first name, and department name.

SELECT
emps.emp_no, emps.last_name, emps.first_name, departments.dept_name
FROM
employees as emps
JOIN dept_emp 
ON emps.emp_no = dept_emp.emp_no
JOIN departments
ON dept_emp.dept_no = departments.dept_no;


--List all employees whose first name is "Hercules" and last names begin with "B."

SELECT *
FROM employees
WHERE first_name = 'Hercules' and last_name LIKE 'B%';

--List all employees in the Sales department, including their employee number, last name, 
--first name, and department name.

SELECT
emps.emp_no, emps.last_name, emps.first_name, departments.dept_name
FROM
employees as emps
JOIN dept_emp 
ON emps.emp_no = dept_emp.emp_no
JOIN departments
ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_no = 'd007';

--List all employees in the Sales and Development departments, including their employee number, 
--last name, first name, and department name.

SELECT
emps.emp_no, emps.last_name, emps.first_name, departments.dept_name
FROM
employees as emps
JOIN dept_emp 
ON emps.emp_no = dept_emp.emp_no
JOIN departments
ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_no = 'd007' OR 'd005';

--In descending order, list the frequency count of employee last names, 
--i.e., how many employees share each last name.
--hashtag holy shit i tried to get this one to work sixty two ways but alas it's Miller Time boys.
--i leave you with the code that is least likely to be completely Fd up. Thanks.
SELECT count(last_name)
FROM employees
WHERE last_name == last_name
ORDER BY last_name DESC;