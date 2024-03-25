
#1- Write the SQL code that creates the tables and enforces Primary and foreign key constraints.
#Your SQL Code Goes Below:

use 310jonathan; #Your database Schema Name instead
SET FOREIGN_KEY_CHECKS=0;

#a
DROP TABLE dept CASCADE;
Create TABLE dept(
Dname VARCHAR(32) PRIMARY KEY, 
school VARCHAR(32) NOT NULL
);

#b
DROP TABLE course CASCADE;
CREATE TABLE course (
    prefix VARCHAR(10),
    cnumber INT NOT NULL,
    coursename VARCHAR(32) NOT NULL,
    deptName varchar(32)NOT NULL,
	PRIMARY KEY (prefix, cnumber),
    FOREIGN KEY (deptName) REFERENCES dept(Dname)
);

#c
DROP TABLE courseSection CASCADE;
#(prefix, cnumber) is a FK that points to the course PK
CREATE TABLE courseSection(
    crn DECIMAL(6,0) PRIMARY KEY, 
    prefix VARCHAR(10),
    cnumber INT, 
    capacity DECIMAL(2,0) NOT NULL, 
    semester VARCHAR(16), 
    year DECIMAL(4,0),
    FOREIGN KEY (prefix, cnumber) references course(prefix, cnumber)
); 

SET FOREIGN_KEY_CHECKS=1;



#2- Reverse Engineer your schema according to the guidelines in the word document
# and upload it to Moodle as a PNG
## File --> Export as PNG to save the diagram into a shape file with yourLnameFname.png




#3 Insert 3-Department Records into the dept table. 
## Your SQL Code Goes Below:

Describe dept; 
insert into dept values('Accounting', 'OMSB');
insert into dept values('CIS', 'OMSB');
insert into dept values('Biology', 'Kakos');
select * from dept;

#4 Insert 6 Courses into the Course table; 
## make sure you assign them to different departments. 
## Your SQL Code Goes Below:

Describe course; 
insert into course values('CIS', 110, 'Intro to Programming', 'CIS');
insert into course values('CIS', 310, 'Business Data Management', 'CIS');
insert into course values('ACCT', 201 , 'Financial Accounting', 'Accounting');
insert into course values('ACCT', 205 , 'Managerial Accounting', 'Accounting');
insert into course values('BIO', 110 , 'Intro to Biology', 'Biology');
insert into course values('BIO', 310, 'Environments', 'Biology');
select * from course;

#5 Insert 12 course-sections into the courseSection table across different years and semesters. 
## No more than 3 course sections for a given year and a given semester. 
## Your SQL Code Goes Below:

Describe courseSection; 
insert into courseSection values(123456, 'CIS', 110, 30, 'Fall', 2024);
insert into courseSection values(123455, 'CIS', 110, 30, 'Fall', 2024);
insert into courseSection values(123444, 'CIS', 310, 20, 'Spring', 2023);
insert into courseSection values(123333, 'ACCT', 201, 30, 'Fall', 2023);
insert into courseSection values(122222, 'ACCT', 201, 24, 'Spring', 2024);
insert into courseSection values(111111, 'ACCT', 201, 25, 'Fall', 2022);
insert into courseSection values(111116, 'ACCT', 205, 20, 'Fall', 2025);
insert into courseSection values(111156, 'BIO', 110, 30, 'Fall', 2022);
insert into courseSection values(111456, 'BIO', 310, 30, 'Spring', 2026);
insert into courseSection values(113456, 'BIO', 310, 35, 'Fall', 2021);
select * from courseSection;

