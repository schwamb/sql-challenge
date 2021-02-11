Final edits including completion of data over time charts and final images
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS titles;


CREATE TABLE "departments" (
	dept_no varchar (4) NOT NULL,
	dept_name varchar (50) NOT NULL
);

CREATE TABLE "dept_emp" (
	emp_no integer NOT NULL,
	dept_no varchar (4) NOT NULL
);

CREATE TABLE "dept_manager" (
	dept_no varchar (4) NOT NULL,
	emp_no integer NOT NULL
);

CREATE TABLE "employees" (
	emp_no integer NOT NULL,
	title_id varchar (5) NOT NULL,
	birth_date date,
	first_name varchar (50) NOT NULL,
	last_name varchar (50) NOT NULL,
	sex varchar (2),
	hire_date date
);

CREATE TABLE "salary" (
	emp_no integer NOT NULL,
    salary integer NOT NULL
);

CREATE TABLE "titles" (
	title_id varchar (5) NOT NULL,
	title varchar (20) NOT NULL
);