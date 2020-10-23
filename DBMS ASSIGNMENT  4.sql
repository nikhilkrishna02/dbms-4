create database company;
use company;
create table Department(
department_id int,
department_name varchar(100),
city varchar(100),
salary int,
department_website varchar(200),
department_number int,
primary key (department_id));

desc department;
insert into Department values(1,'Hardware','Banglore',80000,'www.blorehardwaresolutions.com',080654772);
insert into Department values(2,'Software','Mysuru',300000,'www.mysurusoftwares.com',080758925);
insert into Department values(3,'Tester','Manglore',40000,'www.mangloretestingsolutions.com',080652379);
insert into Department values(4,'Developer','Hubli',60000,'www.hublitechdevelopers.com',080666644);
insert into Department values(5,'System_Specialist','Banglore',35000,'www.bangloresysments.com',080654762);
insert into Department values(6,'System_Analyst','Hubli',45000,'www.hublianalysts.com',080666655);
insert into Department values(7,'Technician','Banglore',20000,'www.bangloretechies.com',080654752);

select* from Department;

create table Employees(
employees_id int,
employess_name varchar(100),
department_id int,
mail_id varchar(100),
hire_date int,
employee_salary int,
primary key (employees_id),
foreign key (department_id) references Department (department_id)
);

desc Employees;
insert into Employees values(101,'Darshan',2,'darsh@gmail.com',15/10/2012,25000);
insert into Employees values(102,'Jagga',3,'jagga@gmail.com',12/02/2014,13000);
insert into Employees values(103,'Arun',1,'arun@gmail.com',02/02/2018,17000);
insert into Employees values(104,'Nikhil',7,'nikki@gmail.com',19/08/2011,29000);
insert into Employees values(105,'Harish',5,'harishkalyan@gmail.com',02/07/2013,27000);
insert into Employees values(106,'Prashanti',6,'yprashanti@gmail.com',19/06/2008,39000);
insert into Employees values(107,'Sandya',4,'sandyas@gmail.com',08/12/2018,17000);

select * from Employees;

-- Using select Query 
-- 1.Order by Clause :
select *from department order by salary;
select *from department order by city desc;

-- 2. Group by and having :
select count(department_id), city from department group by city;
select count(department_id), city from department group by city having count(department_id)>2;

-- 3. Aggregate functions :
-- (i).MIN :
select min(department_id) from department;
-- (ii).MAX :
select max(department_id) from department;
-- (iii).COUNT :
select count(department_id) from department where city= 'Banglore';
-- (iV).AVG :
select avg(department_id) from department;
-- (V).SUM :
select sum(department_id) from department;

-- 4. Logical operators especially with LIKE :
select *from department where city like 'M%';
select *from department where city like '%e';
select *from department where department_name like '_a%';
select *from department where department_name like 'b_';
select *from department where department_name like 'b%e';

-- 5. At least 4 Nested queries specific to your Database, out of which at least 2 should
-- have multiple subquery :
select department_name as salary,department_website
from department
where department_id in (
   select department_id
   from department
   where department_website in (
		select department_website
        from department
		having (department_number in ( 08066 , 08054 , 08023 , 08049 , 08065 ) or department_name= 'Tester') and (city like 'M%') and (department_id between 1 and 7 )
   )
) ;

