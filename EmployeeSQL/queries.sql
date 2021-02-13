-- List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT employees.emp_no, last_name, first_name, sex,  salary.salary
FROM
employees
JOIN salary ON employees.emp_no = salary.emp_no;

-- List first name, last name, and hire date for employees who were hired in 1986.
-- https://stackoverflow.com/questions/4799615/postgresql-select-data-with-a-like-on-timestamp-field
SELECT first_name, last_name, hire_date
FROM 
employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986

-- List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT dept_manager.dept_no, departments.dept_name, dept_manager.emp_no, employees.first_name, employees.last_name
FROM
dept_manager
JOIN departments on departments.dept_no = dept_manager.dept_no,
JOIN employees on employees.emp_no = dept_manager.emp_no;

-- List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name;
FROM
employees
JOIN dept_emp on dept_emp.emp_no = employees.emp_no
JOIN departments on departments.dept_no = dept_emp.dept_no;

-- List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name, sex
FROM
employees
WHERE
first_name = 'Hercules' AND
last_name LIKE 'B%';

-- List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT employees.emp_no, employees.first_name, employees.last_name, dept_emp.dept_no, departments.dept_name
FROM 
employees
JOIN dept_emp ON dept_emp.emp_no = employees.emp_no
JOIN departments ON departments.dept_no = dept_emp.dept_no
WHERE 
departments.dept_name = 'Sales';


-- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT employees.emp_no, employees.first_name, employees.last_name, dept_emp.dept_no, departments.dept_name
FROM 
employees
JOIN dept_emp ON dept_emp.emp_no = employees.emp_no
JOIN departments ON departments.dept_no = dept_emp.dept_no
WHERE 
departments.dept_name = 'Sales' OR
departments.dept_name = 'Development';

-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, COUNT(last_name) as "Count of Last Name"
FROM
employees
GROUP BY last_name
ORDER BY "Count of Last Name" desc;

