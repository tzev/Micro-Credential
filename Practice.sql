--Practice Questions
/*
1: Create a list of employee names and their full addresses using 
the INNER JOIN.
*/
select emp.firstname, emp.lastname, addr.addressline1, 
	   addr.addressline2, addr.city, addr.state, addr.zip1
from employees emp
inner join addresses addr on addr.employeeid = emp.employeeid
/*
2: Create a list of employee names and their full addresses using the 
INNER JOIN for employees who live either in Massachusetts or California.
*/
select emp.firstname, emp.lastname, addr.addressline1, 
	   addr.addressline2, addr.city, addr.state, addr.zip1
from employees emp
inner join addresses addr on addr.employeeid = emp.employeeid
where lower(state) = 'ca' or lower(state) = 'ma'
/*
3: Create an example of a Cartesian product using the Employees and Addresses table.
*/
select * from employees, addresses
/*
4: Use a LEFT OUTER JOIN to list all employee first and last names as well 
as the gender and birthdates of their dependents if they have any.
*/
select emp.firstname, emp.lastname, dep.gender, dep.birthdate
from employees emp
left outer join dependents dep on emp.employeeid = dep.employeeid
/*
5: Use a RIGHT OUTER JOIN to list all employee first and last names as well 
as the gender and birthdates of their dependents if they have any. 
*/
select emp.firstname, emp.lastname, dep.gender, dep.birthdate
from employees emp
right outer join dependents dep on emp.employeeid = dep.employeeid
/*
6: Use a SELF JOIN to select the employee first name, last name, title 
as well as the manager's first name, last name and title.
*/
select emp.firstname employee_firstname, emp.lastname employee_lastname,
	   emp.title employee_title, man.firstname manager_firstname, 
	   man.lastname manager_lastname, man.title manager_title
from employees emp, employees man
where man.employeeid = emp.managerid
/*
7: Retrieve the employee first name, last name, department name and 
group name for the employee named Gail Erickson.
*/
select emp.firstname, emp.lastname, dep.departmentname, dep.groupname
from employees emp
inner join employeesdepartments edep on edep.employeeid = emp.employeeid
inner join departments dep on dep.departmentid = edep.departmentid
where lower(emp.firstname) = 'gail' and lower(emp.lastname) = 'erickson'
/*
8: Retrieve the employee first name, last name, address, city, state, 
zip, department name and group name for the employee named David Bradley.
*/
select emp.firstname, emp.lastname, addr.addressline1, addr.addressline2, 
	   addr.city, addr.state, addr.zip1, dep.departmentname, dep.groupname
from employees emp
inner join addresses addr on addr.employeeid = emp.employeeid
inner join employeesdepartments edep on edep.employeeid = emp.employeeid
inner join departments dep on dep.departmentid = edep.departmentid
where lower(emp.firstname) = 'david' and lower(emp.lastname) = 'bradley'
/*
9: Retrieve the employee first name, last name, dependent first name, 
last name and gender for female dependents.
*/
select emp.firstname, emp.lastname, dep.firstname, dep.lastname, dep.gender
from employees emp
inner join dependents dep on emp.employeeid = dep.employeeid
where lower(dep.gender) = 'f'
/*
10: Retrieve the employee first name, last name, dependent first name, 
last name, birth date for dependents who have birth dates less than or
equal to 11/02/2008. 
*/
select emp.firstname, emp.lastname, dep.firstname, dep.lastname,
	   dep.birthdate
from employees emp
inner join dependents dep on emp.employeeid = dep.employeeid
where dep.birthdate <= '11/02/2008'
/*
11: Use LEFT OUTER JOINS to list all Employees, their Department Names, 
and their dependent names, if any.
*/
select emp.firstname, emp.lastname, dep.departmentname, depend.firstname,
	   depend.lastname
from employees emp
left outer join employeesdepartments edep on edep.employeeid = emp.employeeid
left outer join departments dep on dep.departmentid = edep.departmentid
left outer join dependents depend on depend.employeeid = emp.employeeid
/*
12: Use RIGHT OUTER JOINS to list all Employees, their Department Names, 
and their dependent names, like you did in the question above.
*/
select emp.firstname, emp.lastname, dep.departmentname, depend.firstname,
	   depend.lastname
from employees emp
right outer join employeesdepartments edep on edep.employeeid = emp.employeeid
right outer join departments dep on dep.departmentid = edep.departmentid
right outer join dependents depend on depend.employeeid = emp.employeeid
/*
13: Retrieve the employee first name, last name, dependent first name, 
last name and gender for dependents who were born in or before 1998.
*/
select emp.firstname, emp.lastname, dep.firstname, dep.lastname,
	   dep.gender
from employees emp
inner join dependents dep on dep.employeeid = emp.employeeid
where dep.birthdate < '01/01/1999'
/*
14: Retrieve all employees belonging to the department “Marketing” 
using INNER JOINS.
*/
select emp.firstname, emp.lastname
from employees emp
inner join employeesdepartments edep on edep.employeeid = emp.employeeid
inner join departments dep on dep.departmentid = edep.departmentid
where lower(dep.departmentname) = 'marketing'
/*
15: Retrieve the first name, last name, and title of the manager 
responsible for the Employee with the first name “Ben” and last name “Miller”.
*/
select emp.firstname employee_firstname, emp.lastname employee_lastname,
	   man.title manager_title
from employees emp
inner join employees man on man.employeeid = emp.managerid 
where lower(emp.firstname) = 'ben' and lower(emp.lastname) = 'miller'







