
select * from 310buan.student; #get all records

select distinct major #Unique Values of Major.
from 310buan.student;

select fname, lname, gpa
from buan310.student
where GPA > 3.01 and upper(major)=upper('BUAN');
# i received an error when excecuting this 


#HW-1 PetsRuS
# How will I grade your assignment:
## I will check MySQL DBMS to make sure:
### your work is there, You logged-in to MySQL and did the Work
### I Will run your code

#Your assignment is to create a pets and their owners database 
#that has an owner table and a pet table as follows:

use 310jonathan; #<-------- Change to your schema
set FOREIGN_KEY_CHECKS=0; #To allow dropping a table that has dependecies on it

drop table owner; #Deletes the table if it already exists.
create table owner(
	id numeric primary key, #Numeric, No -ve and Unique
    fName varchar(32) not NULL, #NULL unknown
    lName varchar(32) NOT NULL);
    
DESCRIBE owner;    

insert into owner values(123, 'Musa', 'Jafar');
insert into owner values(124, 'Henry', 'Smith');
select * from owner;
update owner set id=124 where id=123; #Will give ma error

drop table pet; #if it exists
create table pet(
	id numeric PRIMARY KEY,
	name varchar(32) NOT NULL, #NULL means I do not know
	kind varchar(32) NOT NULL, #No two NULL(s) are equal
	breed varchar(32),
	dob date, #Date is a Data type that has its own operations
    ownerId numeric NOT NULL,
    Foreign Key(ownerId) references owner(id) on update cascade
    #data type and format of ownerID, should math that of the owners.id
);
       
DESCRIBE pet;
insert into pet values(1230, 'inky', 'dog', 'lab', '2005-12-01', 123); #yyyy-mm-dd
#Pay attention to the date format
insert into pet values(1240, 'finky', 'dog', NULL, NULL, 123); 
#NULL means I do not know, No two NULLS are equal
select * from pet;



#Your Assignment
#1- Modify the owner table to add
### an email address of max length 32 chars which is unique and Required
### zip code of max length of 8 chars
## Your full code goes below

drop table owner; 
create table owner (
    id NUMERIC PRIMARY KEY, -- Numeric, No -ve, and Unique
    fName VARCHAR(32) NOT NULL, -- NULL unknown
    lName VARCHAR(32) NOT NULL, -- NULL unknown
    email VARCHAR(32) UNIQUE NOT NULL, -- Unique and Required
    zipCode VARCHAR(8) -- Max length of 8 chars
);


#2 Insert 5 owners into your table Your full code goes below

DESCRIBE owner;    

insert into owner values(123, 'Jonathan', 'Carsen', 'jcarsen01@manhattan.edu', 12345);
insert into owner values(124, 'Max ', 'Handler','mhandler01@manhattan.edu', 12344);
insert into owner values(125, 'Ciara', 'McCullough','cmccullough01@manhattan.edu', 19348);
insert into owner values(126, 'Musa', 'Jafar','mjafar01@manhattan.edu', 10987);
insert into owner values(127, 'Mehmet', 'Ulema', 'mulema01@manhattan.edu', 12309);
select * from owner;

#3 modify the pet table to add a color and weight columns your full code goes below

drop table pet; #if it exists
create table pet(
	id numeric PRIMARY KEY,
	name varchar(32) NOT NULL, 
	kind varchar(32) NOT NULL, 
	breed varchar(32),
    weight numeric,
    color varchar(32),
	dob date, 
    ownerId numeric NOT NULL,
    Foreign Key(ownerId) references owner(id) on update cascade
);


#4 insert 15 records into the pet table and distribute them 
## among the different owners, your code goes below

insert into pet values(1230, 'inky', 'dog', 'lab', 50, 'brown','2005-12-01', 123); #yyyy-mm-dd
insert into pet values(1240, 'finky', 'dog', 'poodle', 45, 'white','2012-12-15',123); 
insert into pet values(1250, 'buddy', 'dog', 'golden retriever', 65, 'golden', '2010-05-20', 123);
insert into pet values(1260, 'whiskers', 'cat', 'siamese', 12, 'white', '2018-08-10', 124);
insert into pet values(1270, 'rocky', 'dog', 'boxer', 55, 'brindle', '2014-04-03', 124);
insert into pet values(1280, 'patches', 'cat', 'calico', 10, 'orange', '2017-01-25', 124);
insert into pet values(1290, 'coco', 'dog', 'dachshund', 20, 'black', '2015-11-12', 125);
insert into pet values(1300, 'oliver', 'cat', 'tabby', 15, 'gray', '2019-03-08',  125);
insert into pet values(1310, 'rosie', 'dog', 'beagle', 30, 'tricolor', '2016-06-14', 125);
insert into pet values(1320, 'mittens', 'cat', 'persian', 8, 'white', '2020-09-01', 125);
insert into pet values(1330, 'ziggy', 'dog', 'shih tzu', 18, 'black', '2013-07-22', 126);
insert into pet values(1340, 'sasha', 'cat', 'ragdoll', 14, 'blue', '2011-10-05', 126);
insert into pet values(1350, 'max', 'dog', 'german shepherd', 70, 'black and tan', '2008-02-28', 126);
insert into pet values(1360, 'whiskey', 'cat', 'maine coon', 22, 'brown', '2014-12-19',123);
insert into pet values(1370, 'lola', 'dog', 'pug', 15, 'fawn', '2017-05-10', 123);
select * from pet;


# 5 Date and Time Functions in MySQL, 
## visit the following web-page and familiarize yourself with date and time functions
#https://dev.mysql.com/doc/refman/8.0/en/date-and-time-functions.html
select now(), current_date(),current_time(); #notice the date-time format
select current_date();

#get the age of each pet
select name, kind, breed, datediff(now(), dob) as age from pet; #What is the return
#the return is in days

select name, kind, breed, datediff(now(), dob)/365.25 as age from pet;
#the return is in years, except not years and days, it is just the number of days divided by 365.25, resulting in an answer
#that reads as XX.YYYY

select name, kind, breed, timestampdiff(year, dob, now()) as age from pet;
#this returns the age as JUST the year

#5.1- Without having to divide by 365.25,
### Figure out another MySQL function to calculate date difference in years Only
### and write the SQL Query for that.

select id, name, DATEDIFF(CURDATE(), dob) DIV 365 AS age_in_year FROM pet;

#5.2- Figure out another MySQL function to calculate date difference in 
## Months and write the SQL query for that.

select id,name,TIMESTAMPDIFF(MONTH, dob, CURDATE()) AS age_in_months FROM pet;


# Save and Rename this file to your lastNameFirstName-HW1.sql, 
# and upload it to the course dropbox on Moodle.
