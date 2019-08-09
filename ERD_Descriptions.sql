departments
-
dept_no PK INT FK >- dept_empl.dept_no
dept_name VARCHAR 

dept_empl
-
emp_num INT FK >- employees.emp_num
dept_no VARCHAR 
from_date DATE
to_date DATE

dept_manager
-
dept_no INT FK >- departments.dept_no
emp_num VARCHAR FK >- employees.emp_num
from_date DATE
to_date DATE 

titles
-
emp_num INT
title VARCHAR
from_date DATE
to_date DATE

salaries
-
emp_num INT FK >- employees.emp_num
salary INT 
from_date DATE
to_date DATE 

employees
-
emp_num PK INT FK >- titles.emp_num
birth_date DATE
first_name VARCHAR
last_name VARCHAR
gender VARCHAR
hire_date DATE
