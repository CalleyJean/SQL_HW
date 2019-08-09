---- creating tables, importing files 

--  CREATE TABLE employees (
--    emp_num INT PRIMARY KEY,
--    birth_date date,
--    first_name varchar(100),
--    last_name varchar(100),
--    gender varchar(1),
--    hire_date date
-- );

--  CREATE TABLE salaries (
--      emp_num INT NOT NULL,
--      FOREIGN KEY (emp_num) REFERENCES employees(emp_num),
--      salary money,
--      from_date date,
--      to_date date
--  );

-- CREATE TABLE departments (
--     PRIMARY KEY (dept_no),
-- 	dept_no CHAR(4) NOT NULL,
--     dept_name VARCHAR(40) NOT NULL
-- );

--  CREATE TABLE salaries (
--      emp_num INT NOT NULL,
--      FOREIGN KEY (emp_num) REFERENCES employees(emp_num),
--      salary money,
--      from_date date,
--      to_date date
--  );

-- CREATE TABLE dept_manager (
-- 	dept_no CHAR(4) NOT NULL,
-- 	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
-- 	emp_num INT NOT NULL,
-- 	FOREIGN KEY (emp_num) REFERENCES employees(emp_num),
-- 	from_date date,
-- 	to_date date
-- );

-- CREATE TABLE dept_empl (
-- 	emp_num INT NOT NULL,
-- 	FOREIGN KEY (emp_num) REFERENCES employees(emp_num),
-- 	dept_no CHAR(4) NOT NULL,
-- 	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
-- 	from_date date,
-- 	to_date date
-- );

---- query checking the data that is entered 
-- SELECT * FROM salaries
-- SELECT * FROM departments
-- SELECT * FROM titles
-- SELECT * FROM employees
-- SELECT * FROM dept_manager
-- SELECT * FROM dept_empl

---- 1. List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT employees.emp_num, employees.last_name, employees.first_name, employees.gender, salaries.salary
FROM employees
JOIN salaries
ON employees.emp_num = salaries.emp_num;

---- 2. List employees who were hired in 1986.
SELECT first_name, last_name, hire_date 
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1987-01-01';

---- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
SELECT departments.dept_no, departments.dept_name, dept_manager.emp_num, employees.last_name, employees.first_name, dept_manager.from_date, dept_manager.to_date
FROM departments
JOIN dept_manager
ON departments.dept_no = dept_manager.dept_no
JOIN employees
ON dept_manager.emp_num = employees.emp_num;


---- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT dept_empl.emp_num, employees.last_name, employees.first_name, departments.dept_name
FROM dept_empl
JOIN employees
ON dept_empl.emp_num = employees.emp_num
JOIN departments
ON dept_empl.dept_no = departments.dept_no;

---- 5. List all employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

---- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT dept_empl.emp_num, employees.last_name, employees.first_name, departments.dept_name
FROM dept_empl
JOIN employees
ON dept_empl.emp_num = employees.emp_num
JOIN departments
ON dept_empl.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales';

---- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT dept_empl.emp_num, employees.last_name, employees.first_name, departments.dept_name
FROM dept_empl
JOIN employees
ON dept_empl.emp_num = employees.emp_num
JOIN departments
ON dept_empl.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales' 
OR departments.dept_name = 'Development';

---- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name,
COUNT(last_name) AS "frequency"
FROM employees
GROUP BY last_name
ORDER BY
COUNT(last_name) DESC;
