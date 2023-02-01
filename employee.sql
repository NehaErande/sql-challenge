
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS titles;

   
CREATE TABLE departments(
	dept_no VARCHAR(4) PRIMARY KEY NOT NULL,
	dept_name VARCHAR(45) NOT NULL
);

CREATE TABLE dept_emp(
	emp_no INTEGER NOT NULL,
	dept_no VARCHAR(4) NOT NULL
);

CREATE TABLE dept_manager(
	dept_no VARCHAR(4) NOT NULL,
	emp_no INTEGER NOT NULL
);

CREATE TABLE employees(
	emp_no INTEGER PRIMARY KEY NOT NULL,
	emp_title_id VARCHAR(5) NOT NULL,
	birth_date timestamp without time zone NOT NULL,
	first_name VARCHAR(25) NOT NULL,
	last_name VARCHAR(25) NOT NULL,
	sex VARCHAR(1) NOT NULL,
	hire_date timestamp without time zone NOT NULL
);


CREATE TABLE salaries(
	emp_no INTEGER NOT NULL,
	salary INTEGER NOT NULL
);

CREATE TABLE titles(
	title_id VARCHAR(5) PRIMARY KEY NOT NULL,
	title VARCHAR(30) NOT NULL
);

ALTER TABLE employees ADD FOREIGN KEY (emp_title_id) REFERENCES titles(title_id);
ALTER TABLE dept_manager ADD FOREIGN KEY (emp_no) REFERENCES employees(emp_no);
ALTER TABLE dept_manager ADD FOREIGN KEY (dept_no) REFERENCES departments(dept_no);
ALTER TABLE dept_emp ADD FOREIGN KEY (dept_no) REFERENCES departments(dept_no);
ALTER TABLE dept_emp ADD FOREIGN KEY (emp_no) REFERENCES employees(emp_no);
ALTER TABLE salaries ADD FOREIGN KEY (emp_no) REFERENCES employees(emp_no);