use 310jonathan; #change to your db

set foreign_key_checks=0;
drop table employee cascade;
drop table department cascade;
drop table dept_locations cascade;
drop table project cascade;
drop table works_on cascade;
drop table dependent cascade;
set foreign_key_checks=1;

create table employee (
    fname varchar(16) not null,
    minit char,
    lname varchar(16) not null,
    ssn char(9) not null,
    bdate datetime,
    hiredate datetime default now(),
    address varchar(64),
    gender char,
    salary decimal(10,2),
    super_ssn char(9), 
    dno int,
primary key (ssn)
);

create table department (
    dname varchar(16) not null,
    dnumber int not null,
    mgr_ssn char(9) not null,
    mgr_start_date date, 
    primary key (dnumber),
unique (dname)
);

create table dept_locations ( 
    dnumber int not null,
    dlocation varchar(16) not null,
primary key (dnumber,dlocation) #Composite PK
);

create table project (
    pname varchar(16) not null,
    pnumber int not null,
    plocation varchar(16),
    dnum int not null,
primary key (pnumber),
unique (pname)
);

create table works_on (
    essn char(9) not null,
    pno int not null,
    hours decimal(3,1) not null,
primary key (essn,pno) #Composite PK
);

create table dependent (
    essn char(9) not null,
    dependent_name varchar(16) not null,
    gender char,
    bdate date,
    relationship varchar(8),
primary key(essn,dependent_name) #Composite PK
);

#### Populate your schema
#Load the data from 310buan schema
#Load employee;
insert into employee (
	select * from 310buan.employee);
select * from employee;

##Load department;
insert into department (
	select * from 310buan.deparment);
select * from department;

##Load project;
insert into project (
	select * from 310buan.project);
select * from project;

##Load works_on;
insert into works_on (
	select * from 310buan.works_on);
select * from works_on;

##Load works_on;
insert into dependent (
	select * from 310buan.dependent);
select * from dependent;

##Load works_on;
insert into dept_locations (
	select * from 310buan.dept_locations);
select * from dept_locations;