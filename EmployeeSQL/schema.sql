DROP TABLE IF EXISTS salary;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS titles;

CREATE TABLE titles (
	title_id varchar (5) PRIMARY KEY NOT NULL,
	title varchar (20) NOT NULL
);

CREATE TABLE departments (
	dept_no varchar (4) PRIMARY KEY NOT NULL,
	dept_name varchar (50) NOT NULL
);

CREATE TABLE employees (
	emp_no integer PRIMARY KEY NOT NULL,
	title_id varchar (5) NOT NULL,
	birth_date date,
	first_name varchar (50) NOT NULL,
	last_name varchar (50) NOT NULL,
	sex varchar (2),
	hire_date date,
	FOREIGN KEY (title_id) references titles(title_id)
);

CREATE TABLE dept_emp (
	emp_no integer NOT NULL,
	dept_no varchar (4) NOT NULL,
	FOREIGN KEY (emp_no) references employees(emp_no),
	FOREIGN KEY (dept_no) references departments(dept_no),
	PRIMARY KEY (emp_no, dept_no)
);

CREATE TABLE dept_manager (
	dept_no varchar (4) NOT NULL,
	emp_no integer NOT NULL,
	FOREIGN KEY (emp_no) references employees(emp_no),
	FOREIGN KEY (dept_no) references departments(dept_no),
	PRIMARY KEY (emp_no, dept_no)
);

CREATE TABLE salary (
	emp_no integer NOT NULL,
    salary integer NOT NULL,
	FOREIGN KEY (emp_no) references employees(emp_no),
	PRIMARY KEY (emp_no, salary)
);


--   for something to be a primary key, there must be a foreign key first

-- EXAMPLE OF CREATING TABLE WITH FOREIGN KEY:
-- CREATE TABLE customer_email (
--     id SERIAL PRIMARY KEY,
--     email VARCHAR(30) NOT NULL,
--     customer_id INTEGER NOT NULL,
--     FOREIGN KEY (customer_id) REFERENCES customer(id)
-- );
-- GENERAL PRACTICE IN POSTGRES TO PUT KEY CONTRAINTS AT THE END
-- PRIMARY KEY FOR A TABLE CAN BE MULTIPLE KEYS/COLUMNS
	-- EXAMPLE:
	-- CREATE TABLE student_courses_junction(
	-- 	students_id int,
	-- 	courses_id int,
	-- 	term varchar (15) NOT NULL,
	-- 	PRIMARY KEY (students_id, courses_id, term),
	-- 	FOREIGN KEY (students_id) REFERENCES students(id),
	-- 	FOREIGN KEY (courses_id) REFERENCES courses(id)
	-- )