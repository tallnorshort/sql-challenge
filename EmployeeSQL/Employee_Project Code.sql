--Data Analysis
SELECT * FROM departments;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM titles;

--Question #1-List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.gender, salaries.salary
FROM employees JOIN salaries ON employees.emp_no = salaries.emp_no;
--The select command selects from employees table and the '.' means we are going to pull from the columns within the table, in this case 'emp_no'.
--This can be used for the rest of the columns you need to pull data from i.e.; first name, last name, gender, etc
--'From' clauses will provide the rowset to be exposed through a Select statement, this means all the columns we called from "employee" will be used in the 'Join' command
--'Join Command' combines liked matched items from one or more tables in a relational database, in this case joining employees column 'emp_no' columns with slary column 'salaries_id' columns, and join them together into one column.
--Play for the results
--https://en.wikipedia.org/wiki/Join_(SQL)
--https://en.wikipedia.org/wiki/From_(SQL)

--#2-List employees who were hired in 1986.
SELECT first_name, last_name, hire_date 
FROM employees WHERE hire_date BETWEEN '1986-01-01' AND '1987-01-01';
--Very simple to create, once again a 'select' command, narrowing down the columns you want to grab from the imported csv file
--'From' command says to grab rows from employee table, "WHERE" is the keyword that restricts our select query result set and
--"condition" is the filter to be applied on the results. The filter could be a range, single value or sub query. In this case we are filtering by 'hire_date'
--The SQL 'BETWEEN' condition allows you to easily test if an expression is within a range of values (inclusive)
--In this case, we are creating a between condition for the dates of 1986-01-01 to 1987-01-01. This range of values is connected by an 'and' statement.

--#3- List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
SELECT departments.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name, dept_manager.from_date, dept_manager.to_date
FROM departments 
JOIN dept_manager ON departments.dept_no = dept_manager.dept_no
JOIN employees ON dept_manager.emp_no = employees.emp_no;
--a mix all the things we did above but applied to this question. We use 'Select','From','Join','On' commands to preform this analysis
--https://www.codecademy.com/articles/sql-commands
--https://www.guru99.com/where-clause.html

--#4- List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
JOIN employees ON dept_emp.emp_no = employees.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no;

--Same techinques we used in prior questions. 'Select','From','Join','On' commands used to analyze this data

--#5--List all employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name
FROM employees WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

--This question was a bit more challenging. Seperating the data in the rows of the column required some thinking.
--Did the usual 'Select' command, to specified the columns I needed. The a 'From' employees table
--'Where' will narrow down the row data to the our parameters, in this case 'Hercules'
--As well we need to narrow it down by last_name starting with a "B", so we must do a 'like' command
--The SQL Server 'LIKE' is a logical operator that determines if a character string matches a specified pattern. 
--The percent wildcard (%): any string of zero or more characters.So it is only looking for the letter B to match but nothing else.
--https://www.sqlservertutorial.net/sql-server-basics/sql-server-like/

--#6- List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
JOIN employees ON dept_emp.emp_no = employees.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales';

--For our 'Select' command, we want to select from multiple sources of column data, from multiple tables of data
--I joined the 'emp_no' column data together into one column
--filtered it with our 'where' command, filtering by department name 'Sales'


--#7- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
JOIN employees ON dept_emp.emp_no = employees.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales' OR departments.dept_name = 'Development';
--This is like question 6 but it now wants 'Development' department included with the data. This is easy to do
--An 'OR' command will included a second conditional arguement. In this case, we wanted department name 'Development
--https://www.w3schools.com/sql/sql_and_or.asp

--#8- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name,
COUNT(last_name) AS "frequency"
FROM employees
GROUP BY last_name
ORDER BY
COUNT(last_name) DESC;

