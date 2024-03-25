#Completely and Absolutely Individual Effort
#You have 4 hours to finish the whole exam from the time you download it from Moodle
#Latest Submission Date: Monday March-25-2024 8:00am
#
#Part One (15 points) Create a database Schema and enforce the constraints:
## Use the reverse engineered schema as well as the guidelines stated in the
## word document (part-1 Create vehicle-owner DB Schema.docx)
#
## Your Code goes below
use 310jonathan; #change it to your db
set foreign_key_checks=0;
drop table vehicle cascade;
drop table owner cascade;
#Your Code to create the Schema and Enforce the Constraints goes below
Create Table vehicle(
    vin_number VARCHAR(17) PRIMARY KEY,
    state CHAR(2) NOT NULL,
    plate VARCHAR(10) NOT NULL, 
    make VARCHAR(32) NOT NULL,
    model VARCHAR (32) NOT NULL,
    owner_email_address VARCHAR(255) NOT NULL,
    FOREIGN KEY (owner_email_address) REFERENCES owner(email_address),
    CONSTRAINT unique_state_plate UNIQUE (state, plate)
);

CREATE TABLE owner(
    email_address VARCHAR(255) PRIMARY KEY,
    fname VARCHAR(50) NOT NULL,
    lname VARCHAR(50) NOT NULL,
    phone_number VARCHAR(20) NOT NULL,
    CONSTRAINT unique_phone_number UNIQUE (phone_number)
    );
   
#1. 

DROP TABLE test CASCADE;
CREATE TABLE test (
name VARCHAR(32) UNIQUE,
a INTEGER, 
b INTEGER, 
PRIMARY KEY (a, b));

INSERT INTO test VALUES ('Henry', 30, 40); #Performed
INSERT INTO test VALUES (NULL, 30, 50); #Performed

#

INSERT INTO test VALUES('Mary', 30, 40);
#violation
INSERT INTO test VALUES(NULL, 30, 60); 
#not violation
INSERT INTO test VALUES('Arthur' ,NULL, 40);
#violation

