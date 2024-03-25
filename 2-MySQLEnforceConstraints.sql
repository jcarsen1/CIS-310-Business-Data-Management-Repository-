#Enforce Foreign Key Constraints
use 310jonathan;

alter table employee
add constraint fk_dno 
    foreign key(dno) references department(dnumber);
    
alter table employee
add constraint fk_sup 
    foreign key(super_ssn) references employee(ssn);
    
alter table department 
add constraint fk_mgr 
    foreign key(mgr_ssn) references employee(ssn);
    
alter table dept_locations 
add constraint fk_dnum 
    foreign key(dnumber) references department(dnumber);
    
alter table project 
add constraint fk_dnumb 
    foreign key(dnum) references department(dnumber);
    
alter table works_on 
add constraint fk_essn 
    foreign key(essn) references employee(ssn);
    
alter table works_on 
add constraint fk_pno 
    foreign key(pno) references project(pnumber);
    
alter table dependent 
add constraint fk_emssn 
    foreign key(essn) references employee(ssn);
    
commit; 
#Reverse Engineer Your Schema
