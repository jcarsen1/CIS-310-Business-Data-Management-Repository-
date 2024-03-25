#Completely and Absolutely Individual Effort
#You have 4 hours to finish the whole ecam from the time you download it from Moodle
#Latest Submission Date: Monday March-25-2024 8:00am
#
#Part Two (35 Points) SQL Queries:
#  
use 310buan;
## Use the 310buan Employee-Department-Project database to 
-- Write the SQL code for the following queries,
#.....
Select distinct dname 
from department; #to find-out what are different department names

#Exam-Questions
#1. Get a list of all employees who make more than $50,000 (fname, lname, dname, salary) 
#Your SQL Code

SELECT e.fname, e.lname, d.dname, e.salary
FROM employee e
JOIN department d ON e.dno = d.dnumber
WHERE e.salary > 50000;


#2. Retrieve the fname, lname of all employees who work for the 'sales' department.
#Your SQL Code

SELECT e.fname, e.lname
FROM employee e
JOIN department d ON e.dno = d.dnumber
WHERE d.dname = 'sales';


#3. Retrieve fname, lname of all employees who do not have a supervisor
#Your SQL Code

SELECT fname , lname
FROM employee
where Super_SSN IS NULL;

#4. Retrieve all the projects (project name) that are controlled by the research department.
#Your SQL Code

SELECT p.pname
FROM project p
JOIN department d ON p.dnum = d.dnumber
WHERE d.dname = 'Research';


#5. Get a list of all employees (fname, lname, salary, dname) who 
-- make less than $49,000 and work for the Sales or software departments.
#Your SQL Code

SELECT e.fname, e.lname, e.salary, d.dname
FROM employee e
JOIN department d ON e.dno = d.dnumber
WHERE e.salary < 49000
AND (d.dname = 'Sales' OR d.dname = 'Software');

#6- Get fname, lname of all employees who work on a project controlled by sales department
#Your SQL Code

SELECT DISTINCT e.fname, e.lname
FROM employee e
JOIN works_on w ON e.ssn = w.essn
JOIN project p ON w.pno = p.pnumber
JOIN department d ON p.dnum = d.dnumber
WHERE d.dname = 'Sales';


#7.	Get the count, min salary, max salary and average salary of all employees.
#Your SQL Code

SELECT 
    COUNT(*) AS total_employees,
    MIN(salary) AS min_salary,
    MAX(salary) AS max_salary,
    AVG(salary) AS avg_salary
FROM employee;
 
#8. For each department, 
-- Get the min, max and average salary of all employees grouped by department Name.
#Your SQL Code

SELECT 
    d.dname AS department_name,
    MIN(e.salary) AS min_salary,
    MAX(e.salary) AS max_salary,
    AVG(e.salary) AS avg_salary
FROM department d
JOIN employee e ON d.dnumber = e.dno
GROUP BY d.dname;

#9 For each department manager, get their firstname, last name and salary

SELECT 
    mgr.fname AS manager_first_name,
    mgr.lname AS manager_last_name,
    mgr.salary AS manager_salary
FROM 
    employee AS mgr 
JOIN 
    employee AS emp 
ON 
    mgr.ssn = emp.mgr_ssn
WHERE 
    emp.position = 'Manager';



#10 Management wants a report of 
## all employees (fName, lName, age, department name and salary)
## that are above 50 years old.
#Your SQL Code

SELECT 
    e.fname AS fName,
    e.lname AS lName,
    YEAR(CURRENT_DATE()) - YEAR(e.dob) - (RIGHT(CURRENT_DATE(), 5) < RIGHT(e.dob, 5)) AS age,
    d.dname AS department_name,
    e.salary
FROM 
    employee e
JOIN 
    department d ON e.dno = d.dnumber
WHERE 
    e.birth_date < '1974-03-23';


#11 Management wants a report of all employees (fName, lName, salary), 
## that make less than the overall average salary of the company.


SELECT 
fname AS fName,
lname AS lName,
salary
FROM employee
WHERE salary < (
SELECT 
AVG(salary) 
FROM 
employee
);


#12 Management wants a report of all employees (fName, lName, salary), 
## that make less than the average salary of the department they work on.

SELECT e.fname AS fName, e.lname AS lName,e.salary
FROM employee e
JOIN department d ON e.dno = d.dnumber
JOIN 
(
SELECT 
dnumber, AVG(salary) AS avg_salary
FROM employee
GROUP BY dnumber
) AS dept_avg ON d.dnumber = dept_avg.dnumber
WHERE e.salary < dept_avg.avg_salary;
