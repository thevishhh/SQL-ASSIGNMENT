create database Workerdb;
use Workerdb;
create table Workers (Worker_id int not null primary key auto_increment,
                      First_name char(100),
                      Last_name char(100),
                      Salary decimal (8,0) not null,
                      Joining_date datetime not null,
                      Department char(50));
                      
 
INSERT INTO workers
VALUES (
'1',
'Monika',
'Arora',
'100000',
str_to_date('20-FEB-2014', '%d-%M-%Y'),
'HR'
   );

    desc workers;
   
   INSERT INTO workers
VALUES (
'2',
'Niharika',
'Vema',
'80000',
str_to_date('6-JUN-2014', '%d-%M-%Y'),
'Admin'
   );
   
   INSERT INTO workers
VALUES (
'3',
'Vishal',
'Singhal',
'300000',
str_to_date('20-FEB-2014', '%d-%M-%Y'),
'HR'
   );
   
   INSERT INTO workers
VALUES (
'4',
'Amitabh',
'Singh',
'500000',
str_to_date('20-FEB-2014', '%d-%M-%Y'),
'Admin'
   );
   
   INSERT INTO workers
VALUES (
'5',
'Vivek',
'Bhati',
'500000',
str_to_date('11-JUN-2014', '%d-%M-%Y'),
'Admin'
   );
   
INSERT INTO workers
VALUES (
'6',
'Vipul',
'Diwan',
'200000',
str_to_date('11-JUN-2014', '%d-%M-%Y'),
'Account'
   );
   
   INSERT INTO workers
VALUES (
'7',
'Satish',
'Kumar',
'75000',
str_to_date('20-JAN-2014', '%d-%M-%Y'),
'Account'
   );

INSERT INTO workers
VALUES (
8,
'Geeta',
'Chauhan',
'90000',
str_to_date('14-APRIL-2014', '%d-%M-%Y'),
'Admin'
   );
   
   ----------------------------------- assesment 1 --------------------------------------------
   
   --- 1. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending and DEPARTMENT Descending. 
   
   select worker_id, first_name, last_name, salary, joining_date, department from workers order by first_name asc;
   select worker_id, first_name, last_name, salary, joining_date, department from workers order by department desc;
   
   
  --- 2.Write an SQL query to print details for Workers with the first names “Vipul” and “Satish” from the Worker table. 
select * from workers where first_name in ( "vipul" , "satish");

--- 3. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and contains six alphabets. 
   select * from workers where first_name like "%h" and 6;
   
   
--- 4. Write an SQL query to print details of the Workers whose SALARY lies between 1. 
    select * from workers where salary between 100000 and 500000;
   
--- 5. Write an SQL query to fetch duplicate records having matching data in some fields of a table. 
 select worker_id, count(*) from workers group by worker_id having count(*) > 1;
   
   
--- 6. Write an SQL query to show the top 6 records of a table. 
  select worker_id, first_name, last_name, salary, joining_date, department from workers order by salary desc limit 6; 

--- 7. Write an SQL query to fetch the departments that have less than five people in them. 
     select  department, count(department) from workers group by department limit 5;
     
     
--- 8. Write an SQL query to show all departments along with the number of people in there. 
   select  department, count(department) as people from workers group by department;
   
--- 9. Write an SQL query to print the name of employees having the highest salary in each department. 
    select first_name, last_name,department,salary from workers order by salary;
    
    
----------------------------------------------- assesment 2 --------------------------------------------------------------------


--- 1 To display all the records form STUDENT table. SELECT * FROM student ; 
select * from student;

--- 2. To display any name and date of birth from the table STUDENT. SELECT StdName, DOB FROM student ; 
select std_name , DOB from student;

--- 3. To display all students record where percentage is greater of equal to 80 FROM student table. SELECT * FROM student WHERE percentage >= 80; 
select * from student where percentage >=80;

--- 4. To display student name, stream and percentage where percentage of student is more than 80. SELECT StdName, Stream, Percentage WHERE percentage > 80; 
select std_name,stream,percentage from student where percentage >80;


--- 5. To display all records of science students whose percentage is more than 75 form student table. SELECT * FORM student WHERE stream = ‘Science’ AND percentage > 75; 
select * from student where stream="science" and percentage >75;


