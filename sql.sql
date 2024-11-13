/* Day 1: Basics and Data Retrieval */
/* Create the emp table with attributes: emp_id, emp_name, hire_date, dept_id, salary, and commission. */
create table emp (
    empid number(10) primary key,
    emp_name varchar2(10) not null,
    hire_date date,
    dept_id number(10),
    salary number(10),
    commission number(10)
);

insert into emp values(1, 'Subhajit Gorai', TO_DATE('25-10-2014', 'DD-MM-YYYY'), 1, 100000, 10000);
insert into emp values(2, 'Chand Gorai', TO_DATE('25-10-2015', 'DD-MM-YYYY'), 5, 200000, 20000);
insert into emp values(3, 'Kand Gorai', TO_DATE('25-10-2016', 'DD-MM-YYYY'), 2, 300000, 30000);
insert into emp values(4, 'Pal Gorai', TO_DATE('25-10-2017', 'DD-MM-YYYY'), 3, 400000, 40000);
insert into emp values(5, 'Dal Gorai', TO_DATE('25-10-2018', 'DD-MM-YYYY'), 6, 600000, 60000);
insert into emp values(6, 'Chal Gorai', TO_DATE('25-10-2019', 'DD-MM-YYYY'), 7, 700000, 70000);
insert into emp values(7, 'Kartick Gorai', TO_DATE('25-10-2020', 'DD-MM-YYYY'), 8, 900000, null);

/* Insert additional employee records with common department assignments. */

insert into emp values(18, 'Ravi Shankar', TO_DATE('15-11-2021', 'DD-MM-YYYY'), 1, 750000, 5000);  -- Dept 1
insert into emp values(19, 'Anjali Mehta', TO_DATE('20-12-2021', 'DD-MM-YYYY'), 1, 800000, 6000);  -- Dept 1
insert into emp values(20, 'Suresh Kumar', TO_DATE('10-01-2022', 'DD-MM-YYYY'), 2, 720000, NULL);  -- Dept 2
insert into emp values(21, 'Priya Singh', TO_DATE('05-02-2022', 'DD-MM-YYYY'), 2, 680000, 7000);    -- Dept 2
insert into emp values(22, 'Amit Verma', TO_DATE('30-03-2022', 'DD-MM-YYYY'), 3, 900000, 8000);     -- Dept 3
insert into emp values(23, 'Neha Sharma', TO_DATE('15-04-2022', 'DD-MM-YYYY'), 3, 950000, NULL);    -- Dept 3
insert into emp values(24, 'Karan Joshi', TO_DATE('25-05-2022', 'DD-MM-YYYY'), 4, 600000, 3000);     -- Dept 4
insert into emp values(25, 'Deepa Reddy', TO_DATE('10-06-2022', 'DD-MM-YYYY'), 4, 650000, 4000);      -- Dept 4
insert into emp values(26, 'Vikram Patel', TO_DATE('20-07-2022', 'DD-MM-YYYY'), 5, 700000, NULL);     -- Dept 5
insert into emp values(27, 'Sonia Gupta', TO_DATE('01-08-2022', 'DD-MM-YYYY'), 5, 720000, 2000);      -- Dept 5

/* Display all data from the emp table. */

select * from emp;

/* Show the employee number, name, dept_id, and hire date for each employee, with alias "STARTDATE" for hire_date. */

select empid, emp_name, dept_id, hire_date as STARTDATE from emp;

/* Display unique dept_id values from the emp table. */

select distinct dept_id from emp;

/* Show employee names concatenated with dept_id, separated by a comma and space, labeled "Employee and Title". */

select emp_name || ", " || dept_id  as "Employee and Title" from emp;

/* Calculate and display the annual salary of each employee. */

select emp_name, (salary * 12) as "ANNUAL SALARY" from emp;

/* Day 2: Filtering and Sorting */

/* Display the names of employees who have both 'a' and 'e' in their names. */

select ename from emp where emp_name like '%a%' and emp_name like '%e%'; 

/* Show the name and dept_id of employees who do not earn a commission. */

select emp_name, dept_id from emp where commission is null;

/* Display the name and salary (labeled "Monthly Salary") for employees earning between Rs. 250000 and Rs. 420000 in departments 2 or 3. */

select emp_name, salary as "MONTHLY SALARY" from emp where dept_id in (2, 3) and salary between 250000 and 420000;

/* Display all employee names starting with 'J', 'A', or 'M', sorted by name. */

select emp_name from emp where emp_name like 'J%' or emp_name like 'A%' or emp_name like 'M%' order by emp_name;

/* Calculate the total salary (salary + commission) for all employees. */

select salary + commission as "Total Salary" from emp;

/* Day 3: Constraints */
/* Create the Depart table with columns: dept_id, dept_name, location_name, where dept_id is the primary key. */

create table Depart (
    dept_id number(10) primary key,
    dept_name varchar2(50),
    location_name varchar2(50)
);

/* Create the Employ table with columns: empid, name, salary, hire_date, department_no, where empid is the primary key and department_no is a foreign key referencing dept_id in Depart. */

create table Employ (
    empid number(10) primary key,
    name varchar2(50),
    salary number(10),
    hire_date date,
    department_no number(4),
    foreign key (department_no) references Depart(dept_id)
);

/* Ensure that salary is non-null and dept_name is unique in Depart. */

alter table Employ modify salary not null;

alter table Depart add constraint u1 unique (dept_name);

/* Insert at least 3 rows into the Depart table and 5 rows into the Employ table. */

/* Insert rows into the Depart table */
insert into Depart values(1, 'Human Resources', 'New York');
insert into Depart values(2, 'Research and Development', 'San Francisco');
insert into Depart values(3, 'Marketing', 'Los Angeles');
insert into Depart values(4, 'Sales', 'Chicago');
insert into Depart values(5, 'Finance', 'Houston');
insert into Depart values(6, 'IT Support', 'Seattle');
insert into Depart values(7, 'Customer Service', 'Miami');
insert into Depart values(8, 'Logistics', 'Dallas');
insert into Depart values(9, 'Legal', 'Boston');
insert into Depart values(10, 'Public Relations', 'Atlanta');
insert into Depart values(11, 'Product Management', 'Denver');
insert into Depart values(12, 'Quality Assurance', 'Phoenix');
insert into Depart values(13, 'Training and Development', 'Philadelphia');
insert into Depart values(14, 'Business Development', 'San Diego');
insert into Depart values(15, 'Corporate Strategy', 'Washington D.C.');

/* Insert rows into the Employ table */
insert into Employ values(1, 'Subhajit Gorai', 90000, TO_DATE('25-10-2013', 'DD-MM-YYYY'), 1);
insert into Employ values(2, 'Chand Gorai', 85000, TO_DATE('15-05-2014', 'DD-MM-YYYY'), 2);
insert into Employ values(3, 'Kand Gorai', 78000, TO_DATE('10-08-2015', 'DD-MM-YYYY'), 3);
insert into Employ values(4, 'Pal Gorai', 95000, TO_DATE('20-12-2016', 'DD-MM-YYYY'), 1);
insert into Employ values(5, 'Dal Gorai', 80000, TO_DATE('30-01-2017', 'DD-MM-YYYY'), 2);
insert into Employ values(6, 'Chal Gorai', 72000, TO_DATE('05-03-2018', 'DD-MM-YYYY'), 3);
insert into Employ values(7, 'Ravi Kumar', 88000, TO_DATE('15-04-2019', 'DD-MM-YYYY'), 4);
insert into Employ values(8, 'Anita Singh', 91000, TO_DATE('25-06-2020', 'DD-MM-YYYY'), 5);
insert into Employ values(9, 'Vikram Sharma', 95000, TO_DATE('10-07-2021', 'DD-MM-YYYY'), 6);
insert into Employ values(10, 'Neha Gupta', 87000, TO_DATE('15-08-2021', 'DD-MM-YYYY'), 7);
insert into Employ values(11, 'Rajesh Mehta', 93000, TO_DATE('20-09-2021', 'DD-MM-YYYY'), 8);
insert into Employ values(12, 'Pooja Verma', 76000, TO_DATE('30-10-2021', 'DD-MM-YYYY'), 9);
insert into Employ values(13, 'Suresh Reddy', 79000, TO_DATE('05-11-2021', 'DD-MM-YYYY'), 10);
insert into Employ values(14, 'Kiran Desai', 82000, TO_DATE('15-12-2021', 'DD-MM-YYYY'), 11);
insert into Employ values(15, 'Sneha Joshi', 84000, TO_DATE('01-01-2022', 'DD-MM-YYYY'), 12);

/* Day 4: Data Modification */

/* Create the EMPP table with columns: id, ename, and dept_id. */
create table EMPP (
    id number(10) primary key,        -- Unique identifier for each employee
    ename varchar2(50),               -- Employee name
    dept_id number(10)                -- Department ID, can be a foreign key if needed
);

insert into EMPP values(1, 'Subhajit Gorai', 1);
insert into EMPP values(2, 'Chand Gorai', 2);
insert into EMPP values(3, 'Kand Gorai', 3);
insert into EMPP values(4, 'Pal Gorai', 1);
insert into EMPP values(5, 'Dal Gorai', 2);
insert into EMPP values(6, 'Chal Gorai', 3);
insert into EMPP values(7, 'Ravi Kumar', 4);
insert into EMPP values(8, 'Anita Singh', 5);
insert into EMPP values(9, 'Vikram Sharma', 6);
insert into EMPP values(10, 'Neha Gupta', 7);
insert into EMPP values(11, 'Rajesh Mehta', 8);
insert into EMPP values(12, 'Pooja Verma', 9);
insert into EMPP values(13, 'Suresh Reddy', 10);
insert into EMPP values(14, 'Kiran Desai', 11);
insert into EMPP values(15, 'Sneha Joshi', 12);
insert into EMPP values(16, 'Amit Patel', 1);
insert into EMPP values(17, 'Deepa Reddy', 2);
insert into EMPP values(18, 'Karan Joshi', 3);
insert into EMPP values(19, 'Riya Sharma', 4);
insert into EMPP values(20, 'Mohan Rao', 5);

/* Modify EMPP to allow longer names (100 characters) and add a commission column. */

alter table EMPP modify ename varchar2(100);
alter table EMPP add commission number(10);

/* Rename EMPP to EMP_old. */

alter table EMPP to EMP_old;

/* Create emp_day4 by copying columns from emp. */

create table emp_day4 as select * from emp;

create table emp_day4 as select * from emp where 1=0;

/* Update emp_day4 to increase salaries by Rs. 1000 for those earning less than Rs. 80000. */

update emp_day4 set salary = salary + 1000 where salary < 80000;

/* Delete rows from emp_day4 where salary is more than Rs. 100,000. */

delete from emp_day4 where salary > 100000;

/* Day 5: Single Row and Group Functions */

/* Count the number of employees in each department. */

select department_no, count(id) as "Count" from emp_day4 group by department_no ; 

/* Find the number of managers without listing them, labeled "Number of Managers". */

select count(DISTINCT department_no) as "Number of Managers"  from emp;

/* Show the difference between the highest and lowest salaries, labeled "Difference". */

select max(salary) - min(salary) as "Difference" from emp;

/* Display the max, min, sum, and average salaries of all employees, rounded to the nearest whole number. */

select round(max(salary)) as "Max", round(min(salary)) as "Min", round(sum(salary)) as "Sum", round(avg(salary)) as "Average" from emp;

/* Modify the query to display these values for each department. */

select round(max(salary)) as "Max", round(min(salary)) as "Min", round(sum(salary)) as "Sum", round(avg(salary)) as "Average" from emp group by department_no;

/* Day 6: Joins */
/* Display employee names and department names for employees with an 'a' in their names. */

select emp.emp_name, depart.dept_name from emp JOIN depart ON emp.department_no = depart.dept_id where emp.emp_name like '%a%';

/* Show employee and manager names, and modify it to include employees without managers, ordered by employee number. */

select e.emp_name, m.emp_name from emp e LEFT JOIN emp m ON e.manager_id = m.emp_id order by e.emp_id;

/* List employees hired before their managers, displaying employee name, hire date, manager name, and manager hire date. */

select e.emp_name, e.hire_date, m.emp_name, m.hire_date from emp e JOIN emp m ON e.manager_id = m.emp_id where e.hire_date < m.hire_date;

/* Day 7: Subqueries */
/* Show employee numbers and names for employees earning more than the average salary. */

select emp_id, emp_name from emp where salary > (select avg(salary) from emp);

/* Display employees in departments with someone whose name contains 'u', including their names and salaries for those earning above-average salary. */

select emp_name, salary from emp where dept_id in (select dept_id from emp where emp_name like '%u%') and salary > (select avg(salary) from emp as ee where ee.dept_id = emp.dept_id);

/* Show department number, name, and location of employees in the "Executive" department. */

select d.dept_id, e.emp_name, d.location from emp e JOIN depart d ON d.dept_id = e.department_no where d.dept_name = 'Executive';

/* Find the department with the minimum average salary. */

select d.dept_name, avg(e.salary) from emp e JOIN depart d ON d.dept_id = e.department_no group by d.dept_name having avg(e.salary) = (select min(avgsal) from (select avg(salary) as avgsal from emp group by department_no) as subquery);

select d.depart_name, avg(e.salary) as Average from emp e JOIN depart d ON d.dept_id = e.department_no group by d.depart_name order by Average limit 1;

/* 
    Advanced Self-Join with Recursive Manager-Employee Hierarchies

    Write a query to display each employee’s name, department, hire date, manager’s name, and the manager’s hire date.
    For employees who joined before their manager, highlight them in the result set by adding a Status column labeled 'Hired Before Manager'.

*/