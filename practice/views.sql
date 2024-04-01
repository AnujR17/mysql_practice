create database views;
use views;
create table emptbl(
id int primary key, 
empName varchar(20) not null,
salary decimal(8,2) not null,
empStatus varchar(20) not null,
dept_id int not null
);

create table depttbl(
dept_id int primary key,
deptName varchar(20) not null);

select * from depttbl;
select * from emptbl;

create view v1 
as 
select * from emptbl;

select * from v1;

delete from v1 where id = 3;

insert into v1 values (3, 'Gaurav', 40000, 'Active', 1);

create view v2
as 
select id, empName, salary from emptbl;
select * from v2;

insert into v2(id, empName, salary) values (4, 'Harsh', 60000);

drop view v2;

select* from depttbl;
select * from emptbl;

create view v2
as 
select e.id, e.empName, e.salary, d.deptname from emptbl e
join depttbl d on e.dept_id = d.dept_id;

select * from v2;

update v2 set deptname = "MERN"
where id = 3;