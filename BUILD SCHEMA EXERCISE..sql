
--------------------------------- EXERCISE 1 ---------------------------------------------------    

create database if not exists manufacturerdb;
use manufacturerdb;

CREATE TABLE Manufacturers (
  Code INTEGER,
  Name VARCHAR(255) NOT NULL,
  PRIMARY KEY (Code)   
);

CREATE TABLE Products (
  Code INTEGER,
  Name VARCHAR(255) NOT NULL ,
  Price DECIMAL NOT NULL ,
  Manufacturer INTEGER NOT NULL,
  PRIMARY KEY (Code), 
  FOREIGN KEY (Manufacturer) REFERENCES Manufacturers(Code)
) ENGINE=INNODB;

INSERT INTO Manufacturers(Code,Name) VALUES(1,'Sony');
INSERT INTO Manufacturers(Code,Name) VALUES(2,'Creative Labs');
INSERT INTO Manufacturers(Code,Name) VALUES(3,'Hewlett-Packard');
INSERT INTO Manufacturers(Code,Name) VALUES(4,'Iomega');
INSERT INTO Manufacturers(Code,Name) VALUES(5,'Fujitsu');
INSERT INTO Manufacturers(Code,Name) VALUES(6,'Winchester');

INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(1,'Hard drive',240,5);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(2,'Memory',120,6);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(3,'ZIP drive',150,4);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(4,'Floppy disk',5,6);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(5,'Monitor',240,1);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(6,'DVD drive',180,2);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(7,'CD drive',90,2);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(8,'Printer',270,3);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(9,'Toner cartridge',66,3);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(10,'DVD burner',180,2);

-- 1.1 Select the names of all the products in the store.
select name from products;

-- 1.2 Select the names and the prices of all the products in the store.
select name , price from products;

-- 1.3 Select the name of the products with a price less than or equal to $200.
select * from products where price <= 200;

-- 1.4 Select all the products with a price between $60 and $120.
select * from products where price between 60 and 120;

-- 1.5 Select the name and price in cents (i.e., the price must be multiplied by 100).
select name, concat(price*100, ' cents') from products;

-- 1.6 Compute the average price of all the products.
select avg(price) from products;

-- 1.7 Compute the average price of all products with manufacturer code equal to 2.
select  avg(price) from products 
 where manufacturer = 2;
 
 -- 1.8 Compute the number of products with a price larger than or equal to $180.
 select name,price from products where price >=180;
 
 -- 1.9 Select the name and price of all products with a price larger than or equal to $180, and sort first by price (in descending order), and then by name (in ascending order).
 select name,price from products where price >=180 order by price desc , name asc;
 
 -- 1.10 Select all the data from the products, including all the data for each product's manufacturer.
 select * from products join manufacturers on manufacturers.code = products.manufacturer;
 
 -- 1.11 Select the product name, price, and manufacturer name of all the products.
 select products.name as product_name , price, manufacturers.name as manufacturer_name from products inner join manufacturers on products.manufacturer = manufacturers.code;
 
 -- 1.12 Select the average price of each manufacturer's products, showing only the manufacturer's code.
 select avg(price), manufacturer from products group by manufacturer;
 
 -- 1.13 Select the average price of each manufacturer's products, showing the manufacturer's name.
select avg(a.price), b.name from Products a join Manufacturers b 
on a.manufacturer = b.code
group by b.name;

-- 1.14 Select the names of manufacturer whose products have an average price larger than or equal to $150.
select avg(price) , manufacturers.name as mnufactueres_name from manufacturers join products on manufacturers.code = products.manufacturer
group by manufacturers.name 
having avg(price) >=150;

-- 1.15 Select the name and price of the cheapest product.
select name, price from products order by price asc limit 1;

-- 1.16 Select the name of each manufacturer along with the name and price of its most expensive product.
select products.name as product_name , price , manufacturers.name as manufacturer_name from manufacturers left join products on manufacturers.code = products.manufacturer order by price 
desc ;

-- 1.17 Add a new product: Loudspeakers, $70, manufacturer 2.
insert into products (Code,Name,Price,Manufacturer)
values (11 , "Loudspeakers", 70,  2);
 
 -- 1.18 Update the name of product 8 to "Laser Printer".
 Update products set name ="Laser Printer" 
where name = "Printer"; 
 
 -- 1.19 Apply a 10% discount to all products.
 update products
set price=price*0.9;

-- 1.20 Apply a 10% discount to all products with a price larger than or equal to $120.
update products
set price = price * 0.9
where price >= 120; 


----------------------------------------- EXERCISE 2 --------------------------------------------------

CREATE TABLE Departments (
  Code INTEGER PRIMARY KEY,
  Name varchar(255) NOT NULL ,
  Budget decimal NOT NULL 
);

CREATE TABLE Employees (
  SSN INTEGER PRIMARY KEY,
  Name varchar(255) NOT NULL ,
  LastName varchar(255) NOT NULL ,
  Department INTEGER NOT NULL , 
  foreign key (department) references Departments(Code) 
);

INSERT INTO Departments(Code,Name,Budget) VALUES(14,'IT',65000);
INSERT INTO Departments(Code,Name,Budget) VALUES(37,'Accounting',15000);
INSERT INTO Departments(Code,Name,Budget) VALUES(59,'Human Resources',240000);
INSERT INTO Departments(Code,Name,Budget) VALUES(77,'Research',55000);

INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('123234877','Michael','Rogers',14);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('152934485','Anand','Manikutty',14);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('222364883','Carol','Smith',37);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('326587417','Joe','Stevens',37);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('332154719','Mary-Anne','Foster',14);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('332569843','George','ODonnell',77);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('546523478','John','Doe',59);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('631231482','David','Smith',77);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('654873219','Zacary','Efron',59);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('745685214','Eric','Goldsmith',59);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('845657245','Elizabeth','Doe',14);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('845657246','Kumar','Swamy',14);



-- 2.1 Select the last name of all employees.
select LastName from Employees;


-- 2.2 Select the last name of all employees, without duplicates.
select distinct LastName from employees;


-- 2.3 Select all the data of employees whose last name is "Smith".
select * from employees where lastname = 'Smith';


-- 2.4 Select all the data of employees whose last name is "Smith" or "Doe".
select * from Employees where lastname in ('Smith', 'Doe');

-- 2.5 Select all the data of employees that work in department 14.
select * from Employees where department = 14;

-- 2.6 Select all the data of employees that work in department 37 or department 77.
select * from employees where department in (37, 77);


-- 2.7 Select all the data of employees whose last name begins with an "S".
select * from employees where LastName like 'S%';


-- 2.8 Select the sum of all the departments' budgets.
select sum(budget) from Departments;

-- 2.9 Select the number of employees in each department (you only need to show the department code and the number of employees).
select Department, count(*) from employees group by department;

-- 2.10 Select all the data of employees, including each employee's department's data.
select a. , b. from employees a join departments b on a.department = b.code;

-- 2.11 Select the name and last name of each employee, along with the name and budget of the employee's department.
select a.name, a.lastname, b.name Department_name, b.Budget
from employees a join departments b
on a.department = b.code;

-- 2.12 Select the name and last name of employees working for departments with a budget greater than $60,000.
select name, lastname from employees 
where department in (select code from departments where Budget>60000);

-- 2.13 Select the departments with a budget larger than the average budget of all the departments.
select * from departments 
where budget > (select avg(budget) from departments);

-- 2.14  Select the names of departments with more than two employees.
select b.name from departments b
where code in (select department from employees
group by department having count(*)>2);

-- 2.15
-- Very Important
-- Select the name and last name of employees working for departments with second lowest budget.

select name, lastname from employees
where department =(select temp.code 
from (select * from departments order by budget limit 2) temp
order by temp.budget desc limit 1
);

-- 2.16
-- Add a new department called "Quality Assurance", with a budget of $40,000 and departmental code 11. 
-- Add an employee called "Mary Moore" in that department, with SSN 847-21-9811.
insert into departments values(11, 'Quality Assurance', 40000);
insert into employees values(847219811, 'Mary', 'Moore', 11);

-- 2.17
-- Reduce the budget of all departments by 10%.
update departments 
set budget = 0.9 * budget;

-- 2.18
-- Reassign all employees from the Research department (code 77) to the IT department (code 14).
update employees
set department = 14
where department = 77;

-- 2.19
-- Delete from the table all employees in the IT department (code 14).

delete from employees
where department = 14;

-- 2.20
-- Delete from the table all employees who work in departments with a budget greater than or equal to $60,000.
delete from employees
where department in (select code from departments where budget>=60000);


-- 2.21
-- Delete from the table all employees.
drop table employees;


------------------------------------------------- EXERCISE 3 -----------------------------------------------------------

CREATE TABLE Warehouses (
   Code INTEGER NOT NULL,
   Location VARCHAR(255) NOT NULL ,
   Capacity INTEGER NOT NULL,
   PRIMARY KEY (Code)
 );
CREATE TABLE Boxes (
    Code CHAR(4) NOT NULL,
    Contents VARCHAR(255) NOT NULL ,
    Value REAL NOT NULL ,
    Warehouse INTEGER NOT NULL,
    PRIMARY KEY (Code),
    FOREIGN KEY (Warehouse) REFERENCES Warehouses(Code)
 ) ENGINE=INNODB;
 
  INSERT INTO Warehouses(Code,Location,Capacity) VALUES(1,'Chicago',3);
 INSERT INTO Warehouses(Code,Location,Capacity) VALUES(2,'Chicago',4);
 INSERT INTO Warehouses(Code,Location,Capacity) VALUES(3,'New York',7);
 INSERT INTO Warehouses(Code,Location,Capacity) VALUES(4,'Los Angeles',2);
 INSERT INTO Warehouses(Code,Location,Capacity) VALUES(5,'San Francisco',8);
 
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('0MN7','Rocks',180,3);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('4H8P','Rocks',250,1);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('4RT3','Scissors',190,4);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('7G3H','Rocks',200,1);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('8JN6','Papers',75,1);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('8Y6U','Papers',50,3);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('9J6F','Papers',175,2);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('LL08','Rocks',140,4);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('P0H6','Scissors',125,1);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('P2T6','Scissors',150,2);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('TU55','Papers',90,5);



--- 3.1 select all the warehouses.
select * from warehouses;

--- 3.2 Select all boxes with a value larger than $150.
select * from boxes where value >150;

-- 3.3 Select all distinct contents in all the boxes.
select distinct Contents from boxes;

-- 3.4 Select the average value of all the boxes.
select avg(value) from boxes;

-- 3.5 Select the warehouse code and the average value of the boxes in each warehouse.
select warehouse , avg(value) from boxes group by Warehouse;

-- 3.6 Same as previous exercise, but select only those warehouses where the average value of the boxes is greater than 150.
select warehouse , avg(value) from boxes group by Warehouse having avg(Value) >150;

-- 3.7 Select the code of each box, along with the name of the city the box is located in.
select boxes.code , location from warehouses inner join boxes on warehouses.Code = boxes.Warehouse;

-- 3.8 Select the warehouse codes, along with the number of boxes in each warehouse. 
select warehouse , count(*) from boxes group by warehouse;


------------------------------------------- EXERCISE 4 -------------------------------------------------		

CREATE TABLE Movies (
  Code INTEGER PRIMARY KEY,
  Title VARCHAR(255) NOT NULL,
  Rating VARCHAR(255) 
);

CREATE TABLE MovieTheaters (
  Code INTEGER PRIMARY KEY,
  Name VARCHAR(255) NOT NULL,
  Movie INTEGER,  
    FOREIGN KEY (Movie) REFERENCES Movies(Code)
) ENGINE=INNODB;

INSERT INTO Movies(Code,Title,Rating) VALUES(1,'Citizen Kane','PG');
 INSERT INTO Movies(Code,Title,Rating) VALUES(2,'Singin'' in the Rain','G');
 INSERT INTO Movies(Code,Title,Rating) VALUES(3,'The Wizard of Oz','G');
 INSERT INTO Movies(Code,Title,Rating) VALUES(4,'The Quiet Man',NULL);
 INSERT INTO Movies(Code,Title,Rating) VALUES(5,'North by Northwest',NULL);
 INSERT INTO Movies(Code,Title,Rating) VALUES(6,'The Last Tango in Paris','NC-17');
 INSERT INTO Movies(Code,Title,Rating) VALUES(7,'Some Like it Hot','PG-13');
 INSERT INTO Movies(Code,Title,Rating) VALUES(8,'A Night at the Opera',NULL);
 
 INSERT INTO MovieTheaters(Code,Name,Movie) VALUES(1,'Odeon',5);
 INSERT INTO MovieTheaters(Code,Name,Movie) VALUES(2,'Imperial',1);
 INSERT INTO MovieTheaters(Code,Name,Movie) VALUES(3,'Majestic',NULL);
 INSERT INTO MovieTheaters(Code,Name,Movie) VALUES(4,'Royale',6);
 INSERT INTO MovieTheaters(Code,Name,Movie) VALUES(5,'Paraiso',3);
 INSERT INTO MovieTheaters(Code,Name,Movie) VALUES(6,'Nickelodeon',NULL);
 
 
-- 4.1 Select the title of all movies. 
select title from movies;

-- 4.2 Show all the distinct ratings in the database.
select distinct rating from movies;

-- 4.3  Show all unrated movies.
select * from movies where rating is null;

-- 4.4 Select all movie theaters that are not currently showing a movie.
select * from movietheaters where movie is null;

-- 4.5 Select all data from all movie theaters 
    -- and, additionally, the data from the movie that is being shown in the theater (if one is being shown).
select * from movietheaters left join movies on movietheaters.movie = movies.code;

-- 4.6 Select all data from all movies and, if that movie is being shown in a theater, show the data from the theater.
select * from movies  right join movietheaters on movies.code = movietheaters.movie;

-- 4.7 Show the titles of movies not currently being shown in any theaters.
select movies.title from movietheaters right join movies on movietheaters.movie = movies.code where movietheaters.movie is null;

-- 4.8 Add the unrated movie "One, Two, Three".
insert into movies( code,title,rating)
values (9,"one,two,three",NULL);

-- 4.9 Set the rating of all unrated movies to "G".
update movies set rating= "G" where rating is null;

-- 4.10 Remove movie theaters projecting movies rated "NC-17".
delete from movietheaters where movie in ( select code from movies where rating = "nc-17");


--------------------------------------------------- EXERCISE 5 ---------------------------------------------------------------

CREATE TABLE Pieces (
 Code INTEGER PRIMARY KEY NOT NULL,
 Name TEXT NOT NULL
 );
CREATE TABLE Providers (
 Code VARCHAR(40) 
 PRIMARY KEY NOT NULL,  
 Name TEXT NOT NULL 
 );
CREATE TABLE Provides (
 Piece INTEGER, 
 FOREIGN KEY (Piece) REFERENCES Pieces(Code),
 Provider VARCHAR(40), 
 FOREIGN KEY (Provider) REFERENCES Providers(Code),  
 Price INTEGER NOT NULL,
 PRIMARY KEY(Piece, Provider) 
 );
 
-- alternative one for SQLite
  /* 
 CREATE TABLE Provides (
 Piece INTEGER,
 Provider VARCHAR(40),  
 Price INTEGER NOT NULL,
 PRIMARY KEY(Piece, Provider) 
 );
 */
 
 
INSERT INTO Providers(Code, Name) VALUES('HAL','Clarke Enterprises');
INSERT INTO Providers(Code, Name) VALUES('RBT','Susan Calvin Corp.');
INSERT INTO Providers(Code, Name) VALUES('TNBC','Skellington Supplies');

INSERT INTO Pieces(Code, Name) VALUES(1,'Sprocket');
INSERT INTO Pieces(Code, Name) VALUES(2,'Screw');
INSERT INTO Pieces(Code, Name) VALUES(3,'Nut');
INSERT INTO Pieces(Code, Name) VALUES(4,'Bolt');

INSERT INTO Provides(Piece, Provider, Price) VALUES(1,'HAL',10);
INSERT INTO Provides(Piece, Provider, Price) VALUES(1,'RBT',15);
INSERT INTO Provides(Piece, Provider, Price) VALUES(2,'HAL',20);
INSERT INTO Provides(Piece, Provider, Price) VALUES(2,'RBT',15);
INSERT INTO Provides(Piece, Provider, Price) VALUES(2,'TNBC',14);
INSERT INTO Provides(Piece, Provider, Price) VALUES(3,'RBT',50);
INSERT INTO Provides(Piece, Provider, Price) VALUES(3,'TNBC',45);
INSERT INTO Provides(Piece, Provider, Price) VALUES(4,'HAL',5);
INSERT INTO Provides(Piece, Provider, Price) VALUES(4,'RBT',7);


-- 5.1 Select the name of all the pieces. 
select name from pieces;

-- 5.2  Select all the providers' data. 
select * from providers;

-- 5.3 Obtain the average price of each piece (show only the piece code and the average price).
select piece , avg(price) from provides group by piece;

-- 5.4  Obtain the names of all providers who supply piece 1.
select name from providers where code in ( select provider from provides where piece + 1);

-- 5.5 Select the name of pieces provided by provider with code "HAL".
select pieces.name from pieces join provides on pieces.Code = provides.piece where provides.Provider = "HAL";

-- 5.6
-- ---------------------------------------------
-- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
-- Interesting and important one.
-- For each piece, find the most expensive offering of that piece and include the piece name, provider name, and price 
-- (note that there could be two providers who supply the same piece at the most expensive price).
select (pieces.name) as pieces_name, (providers.name )as providers_name , price from pieces  inner join provides on Pieces.code = piece 
inner join providers on Providers.code = provider where price = (select max(price) from provides where piece = pieces.code);


-- 5.7 Add an entry to the database to indicate that "Skellington Supplies" (code "TNBC") will provide sprockets (code "1") for 7 cents each.						
INSERT INTO Provides(Piece, Provider, Price) 
VALUES (1, 'TNBC', 7);


-- 5.8 Increase all prices by one cent.
update provides set price = price +1;

-- 5.9 Update the database to reflect that "Susan Calvin Corp." (code "RBT") will not supply bolts (code 4).
delete from provides where Provider = "RBT" and piece = 4;

 -- 5.10 Update the database to reflect that "Susan Calvin Corp." (code "RBT") will not supply any pieces 
    -- (the provider should still remain in the database).
delete from provides where Provider = "RBT";

------------------------------------------------ EXERCISE 6 ------------------------------------------------------------

create table Scientists (
  SSN int,
  Name Char(30) not null,
  Primary Key (SSN)
);

Create table Projects (
  Code Char(4),
  Name Char(50) not null,
  Hours int,
  Primary Key (Code)
);
	
create table AssignedTo (
  Scientist int not null,
  Project char(4) not null,
  Primary Key (Scientist, Project),
  Foreign Key (Scientist) references Scientists (SSN),
  Foreign Key (Project) references Projects (Code)
);

INSERT INTO Scientists(SSN,Name) 
  VALUES(123234877,'Michael Rogers'),
    (152934485,'Anand Manikutty'),
    (222364883, 'Carol Smith'),
    (326587417,'Joe Stevens'),
    (332154719,'Mary-Anne Foster'),	
    (332569843,'George ODonnell'),
    (546523478,'John Doe'),
    (631231482,'David Smith'),
    (654873219,'Zacary Efron'),
    (745685214,'Eric Goldsmith'),
    (845657245,'Elizabeth Doe'),
    (845657246,'Kumar Swamy');

 INSERT INTO Projects ( Code,Name,Hours)
 VALUES ('AeH1','Winds: Studying Bernoullis Principle', 156),
       ('AeH2','Aerodynamics and Bridge Design',189),
       ('AeH3','Aerodynamics and Gas Mileage', 256),
       ('AeH4','Aerodynamics and Ice Hockey', 789),
       ('AeH5','Aerodynamics of a Football', 98),
       ('AeH6','Aerodynamics of Air Hockey',89),
       ('Ast1','A Matter of Time',112),
       ('Ast2','A Puzzling Parallax', 299),
       ('Ast3','Build Your Own Telescope', 6546),
       ('Bte1','Juicy: Extracting Apple Juice with Pectinase', 321),
       ('Bte2','A Magnetic Primer Designer', 9684),
       ('Bte3','Bacterial Transformation Efficiency', 321),
       ('Che1','A Silver-Cleaning Battery', 545),
       ('Che2','A Soluble Separation Solution', 778);

 INSERT INTO AssignedTo ( Scientist, Project)
   VALUES (123234877,'AeH1'),
    (152934485,'AeH3'),
    (222364883,'Ast3'),	   
    (326587417,'Ast3'),
    (332154719,'Bte1'),
    (546523478,'Che1'),
    (631231482,'Ast3'),
    (654873219,'Che1'),
    (745685214,'AeH3'),
    (845657245,'Ast1'),
    (845657246,'Ast2'),
    (332569843,'AeH4');
    
    -- 6.1 List all the scientists' names, their projects' names, 
    -- and the hours worked by that scientist on each project, 
    -- in alphabetical order of project name, then scientist name.
    select (scientists.name) as "SCIENTISTS NAME" , (projects.name) as "PROJECTS NAME", projects.hours from scientists
    inner join assignedTo on scientists.SSN= assignedto.scientist
    inner join projects on assignedTo.project = projects.code;
    
    
    
    -- 6.2 Select the project names which are not assigned yet
    select name from projects where code not in (select project from assignedto );
    
    
    
    ----------------------------------------------- EXERCISE 7 -----------------------------------------------------------
CREATE TABLE Employee (
  EmployeeID INTEGER PRIMARY KEY,
  Name VARCHAR(255) NOT NULL,
  Position VARCHAR(255) NOT NULL,
  Salary REAL NOT NULL,
  Remarks VARCHAR(255)
) ENGINE = InnoDB; 

CREATE TABLE Planet (
  PlanetID INTEGER PRIMARY KEY,
  Name VARCHAR(255) NOT NULL,
  Coordinates REAL NOT NULL
) ENGINE = InnoDB; 

CREATE TABLE Shipment (
  ShipmentID INTEGER PRIMARY KEY,
  Date DATE,
  Manager INTEGER NOT NULL,
  Planet INTEGER NOT NULL,
  FOREIGN KEY (Manager) REFERENCES Employee(EmployeeID),
  FOREIGN KEY (Planet) REFERENCES Planet(PlanetID)
) ENGINE = InnoDB;

CREATE TABLE Has_Clearance (
  Employee INTEGER NOT NULL,
  Planet INTEGER NOT NULL,
  Level INTEGER NOT NULL,
  PRIMARY KEY(Employee, Planet),
  FOREIGN KEY (Employee) REFERENCES Employee(EmployeeID),
  FOREIGN KEY (Planet) REFERENCES Planet(PlanetID)
) ENGINE = InnoDB; 

CREATE TABLE Client (
  AccountNumber INTEGER PRIMARY KEY,
  Name VARCHAR(255) NOT NULL
) ENGINE = InnoDB;
  
CREATE TABLE Package (
  Shipment INTEGER NOT NULL,
  PackageNumber INTEGER NOT NULL,
  Contents VARCHAR(255) NOT NULL,
  Weight REAL NOT NULL,
  Sender INTEGER NOT NULL,
  Recipient INTEGER NOT NULL,
  PRIMARY KEY(Shipment, PackageNumber),
  FOREIGN KEY (Shipment) REFERENCES Shipment(ShipmentID),
  FOREIGN KEY (Sender) REFERENCES Client(AccountNumber),
  FOREIGN KEY (Recipient) REFERENCES Client(AccountNumber)
) ENGINE = InnoDB;


INSERT INTO Client VALUES(1, 'Zapp Brannigan');
INSERT INTO Client VALUES(2, "Al Gore's Head");
INSERT INTO Client VALUES(3, 'Barbados Slim');
INSERT INTO Client VALUES(4, 'Ogden Wernstrom');
INSERT INTO Client VALUES(5, 'Leo Wong');
INSERT INTO Client VALUES(6, 'Lrrr');
INSERT INTO Client VALUES(7, 'John Zoidberg');
INSERT INTO Client VALUES(8, 'John Zoidfarb');
INSERT INTO Client VALUES(9, 'Morbo');
INSERT INTO Client VALUES(10, 'Judge John Whitey');
INSERT INTO Client VALUES(11, 'Calculon');
INSERT INTO Employee VALUES(1, 'Phillip J. Fry', 'Delivery boy', 7500.0, 'Not to be confused with the Philip J. Fry from Hovering Squid World 97a');
INSERT INTO Employee VALUES(2, 'Turanga Leela', 'Captain', 10000.0, NULL);
INSERT INTO Employee VALUES(3, 'Bender Bending Rodriguez', 'Robot', 7500.0, NULL);
INSERT INTO Employee VALUES(4, 'Hubert J. Farnsworth', 'CEO', 20000.0, NULL);
INSERT INTO Employee VALUES(5, 'John A. Zoidberg', 'Physician', 25.0, NULL);
INSERT INTO Employee VALUES(6, 'Amy Wong', 'Intern', 5000.0, NULL);
INSERT INTO Employee VALUES(7, 'Hermes Conrad', 'Bureaucrat', 10000.0, NULL);
INSERT INTO Employee VALUES(8, 'Scruffy Scruffington', 'Janitor', 5000.0, NULL);
INSERT INTO Planet VALUES(1, 'Omicron Persei 8', 89475345.3545);
INSERT INTO Planet VALUES(2, 'Decapod X', 65498463216.3466);
INSERT INTO Planet VALUES(3, 'Mars', 32435021.65468);
INSERT INTO Planet VALUES(4, 'Omega III', 98432121.5464);
INSERT INTO Planet VALUES(5, 'Tarantulon VI', 849842198.354654);
INSERT INTO Planet VALUES(6, 'Cannibalon', 654321987.21654);
INSERT INTO Planet VALUES(7, 'DogDoo VII', 65498721354.688);
INSERT INTO Planet VALUES(8, 'Nintenduu 64', 6543219894.1654);
INSERT INTO Planet VALUES(9, 'Amazonia', 65432135979.6547);
INSERT INTO Has_Clearance VALUES(1, 1, 2);
INSERT INTO Has_Clearance VALUES(1, 2, 3);
INSERT INTO Has_Clearance VALUES(2, 3, 2);
INSERT INTO Has_Clearance VALUES(2, 4, 4);
INSERT INTO Has_Clearance VALUES(3, 5, 2);
INSERT INTO Has_Clearance VALUES(3, 6, 4);
INSERT INTO Has_Clearance VALUES(4, 7, 1);
INSERT INTO Shipment VALUES(1, '3004/05/11', 1, 1);
INSERT INTO Shipment VALUES(2, '3004/05/11', 1, 2);
INSERT INTO Shipment VALUES(3, NULL, 2, 3);
INSERT INTO Shipment VALUES(4, NULL, 2, 4);
INSERT INTO Shipment VALUES(5, NULL, 7, 5);
INSERT INTO Package VALUES(1, 1, 'Undeclared', 1.5, 1, 2);
INSERT INTO Package VALUES(2, 1, 'Undeclared', 10.0, 2, 3);
INSERT INTO Package VALUES(2, 2, 'A bucket of krill', 2.0, 8, 7);
INSERT INTO Package VALUES(3, 1, 'Undeclared', 15.0, 3, 4);
INSERT INTO Package VALUES(3, 2, 'Undeclared', 3.0, 5, 1);
INSERT INTO Package VALUES(3, 3, 'Undeclared', 7.0, 2, 3);
INSERT INTO Package VALUES(4, 1, 'Undeclared', 5.0, 4, 5);
INSERT INTO Package VALUES(4, 2, 'Undeclared', 27.0, 1, 2);
INSERT INTO Package VALUES(5, 1, 'Undeclared', 100.0, 5, 1);


-- 7.1 Who receieved a 1.5kg package?
    -- The result is "Al Gore's Head".
select client.name from client join package on client.accountnumber = package.recipient where package.weight = 1.5;


-- 7.2 What is the total weight of all the packages that he sent?
select sum(package.weight) as "total packages" from client join package on client.accountnumber = package.sender where client.name =  "Al Gore's Head";
		
        
---------------------------------------------------- EXERCISE 9 ------------------------------------------------------------

create database CRANELOGS;
USE CRANELOGS;

DESC TABLE cran_logs;

-- 9.1 give the total number of recordings in this table
select count(*) from cran_logs;

-- 9.2 the number of packages listed in this table?
select count(distinct package) from cran_logs;

-- 9.3 How many times the package "Rcpp" was downloaded?
select count(package) from cran_logs where package = "rcpp";

-- 9.4 How many recordings are from China ("CN")?
select count(*) from cran_logs where country = "cn";

-- 9.5 Give the package name and how many times they're downloaded. Order by the 2nd column descently.
select package,count(*) from cran_logs group by package order by 2 desc;

-- 9.6 Give the package ranking (based on how many times it was downloaded) during 9AM to 11AM
select a.package, count(*) from 
(select * from cran_logs where 
		substr(time, 1, 5)<"11:00" 
        and 
        substr(time, 1, 5)>"09:00")
as a
group by a.package 
order by 2 desc;

-- 9.7 How many recordings are from China ("CN") or Japan("JP") or Singapore ("SG")?
select count(*) FROM cran_logs WHERE country ="CN" OR country ="JP" OR country = "SG";

-- 9.8 Print the countries whose downloaded are more than the downloads from China ("CN")
SELECT country FROM
    (SELECT country, COUNT(*) AS downloads FROM cran_logs
           GROUP BY country) as A WHERE
    downloads > (SELECT COUNT(*)FROM cran_logs WHERE country = 'CN');
    
    
 -- 9.9 Print the average length of the package name of all the UNIQUE packages.   
 SELECT AVG(LENGTH(package)) as "average length of packages" FROM (SELECT DISTINCT (package)
	                                                                     FROM cran_logs) as unique_packages;
 
 
 -- 9.10 Get the package whose downloading count ranks 2nd (print package name and it's download count).
 select package , count(package) from cran_logs group by package order by count(package) desc limit 1,1;
 
 
 -- 9.11 Print the name of the package whose download count is bigger than 1000.
 select package,count(package) from cran_logs group by package having count(package) >1000;
 
 -- 9.12 The field "r_os" is the operating system of the users.
    -- 	Here we would like to know what main system we have (ignore version number), the relevant counts, and the proportion (in percentage).

 
 --------------------------------------------------- EXERCISE 10 ----------------------------------------------------

-- table PEOPLE: containing unique ID and corresponding names.
CREATE TABLE PEOPLE (id INTEGER, name CHAR);

INSERT INTO PEOPLE VALUES(1, "A");
INSERT INTO PEOPLE VALUES(2, "B");
INSERT INTO PEOPLE VALUES(3, "C");
INSERT INTO PEOPLE VALUES(4, "D");

-- ADDRESS: containing the history of address information of each ID.

CREATE TABLE ADDRESS (id INTEGER, address char(11), updatedate date);

INSERT INTO ADDRESS VALUES(1, "address-1-1", "2016-01-01");
INSERT INTO ADDRESS VALUES(1, "address-1-2", "2016-09-02");
INSERT INTO ADDRESS VALUES(2, "address-2-1", "2015-11-01");
INSERT INTO ADDRESS VALUES(3, "address-3-1", "2016-12-01");
INSERT INTO ADDRESS VALUES(3, "address-3-2", "2014-09-11");
INSERT INTO ADDRESS VALUES(3, "address-3-3", "2015-01-01");
INSERT INTO ADDRESS VALUES(4, "address-4-1", "2010-05-21");
INSERT INTO ADDRESS VALUES(4, "address-4-2", "2012-02-11");
INSERT INTO ADDRESS VALUES(4, "address-4-3", "2015-04-27");
INSERT INTO ADDRESS VALUES(4, "address-4-4", "2014-01-01");
						
                        
select * from  ADDRESS;
select * from people;


-- 10.1 Join table PEOPLE and ADDRESS, but keep only one address information for each person (we don't mind which record we take for each person). 
    -- i.e., the joined table should have the same number of rows as table PEOPLE
SELECT PEOPLE.id,address, UPDATEDATE FROM address join people 
on address.id = people.id order by people.id;

-- 10.2 Join table PEOPLE and ADDRESS, but ONLY keep the LATEST address information for each person. 
    -- i.e., the joined table should have the same number of rows as table PEOPLE
    
    select people.id,people.name,ADDRESS.id,ADDRESS.address  from people 
    join ADDRESS on people.id = ADDRESS.id order by address;
    
        
