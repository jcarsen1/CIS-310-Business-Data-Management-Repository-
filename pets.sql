use 310jonathan;
create table pets(
id numeric, 
name varchar(32),
breed varchar(32),
age numeric
);

insert into pets values(123,'Inky','dog',15); 
insert into pets values(124,'Macey','dog',12); 
insert into pets values(124,'Puddy','dog',14); 
insert into pets values(124,'Zuzu','cat',12); 
insert into pets values(124,'Zelda','cat',12); 
select * from pets;
select * from pets where breed ='dog';
select * from pets where age > 12;
select name, age from pets;
delete from pets where breed = 'dog'; #I got errors because it said I was using a safe update mode
update pets set age=11 where age=12;
select * from pets;