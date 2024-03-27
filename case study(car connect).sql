create database casestudy;
use casestudy;

---- 1. Customer Table :----
CREATE TABLE Customer
(
	CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50),
    Email VARCHAR(60) UNIQUE,
    PhoneNumber VARCHAR(20) UNIQUE NOT NULL,
    Address VARCHAR(100) NOT NULL,
    Username VARCHAR(50) UNIQUE NOT NULL,
    Password VARCHAR(50) NOT NULL,
    RegistrationDate DATE DEFAULT(current_date())
);
insert into  customer values(1,"karakavalasa","jasmitha",'jasmitha@gmail.com',123457890,'kothagraharam,vzm',"kjessie","jessie482","2024-03-01"),
(2,"koyyana","tejaswani",'tejaswani@gmail.com',987564124,'r&b bungalow,vzm',"kteja","teja123","2024-03-02"),
(3,"kubireddy","hemasree",'hemasree@gmail.com',987654310,'mvp colony,vizag',"khema","hema4a0","2024-03-03"),
(4,"jigininki","swathi",'swathi@gmail.com',857469414,'devijunction,skota',"jswathi","swathi475","2024-03-04"),
(5,"kodeti","varshini",'varshini@gmail.com',893457890,'hitech city,hyd',"kvarshini","varshini490","2024-03-05");

select * from customer;

---- 2. Vehicle Table :----
CREATE TABLE Vehicle (
    VehicleID INT PRIMARY KEY AUTO_INCREMENT,
    Model VARCHAR(100) NOT NULL,
    Make VARCHAR(100) NOT NULL,
    Year INT,
    Color VARCHAR(50),
    RegistrationNumber VARCHAR(20) UNIQUE NOT NULL,
    Availability BOOLEAN NOT NULL,
    DailyRate DECIMAL(10, 2) NOT NULL
);


insert into vehicle values(100,"New NEXA Baleno","Maruti Suzuki",2022,"GREY",15789,true,2600),
(200,"Kia Seltos","Kia India",2019,"white",24879,false,3418),
(300,"Tata punch","Tata Motors Cars",2021,"blue",58746,true,2100),
(400,"Mahindra XUV700","Mahindra",2021,"midnight black",68789,true,3300),
(500,"Hyundai Creta","Hyundai",2014,"lava orange",45789,false,2500);

select * from vehicle;

---- 3. Reservation Table :-----
CREATE TABLE Reservation (
    ReservationID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT,
    VehicleID INT,
    StartDate DATE NOT NULL DEFAULT(CURRENT_DATE()),
    EndDate DATE NOT NULL,
    TotalCost DECIMAL(10, 2) NOT NULL,
    Status VARCHAR(20) NOT NULL,
   foreign key (customerid) references customer(customerid),
   foreign key (vehicleid) references vehicle(vehicleid)
);
insert into reservation values(101,1,100,"2024-03-05","2024-03-06",2600,"pending"),
(102,2,200,"2024-03-06","2024-03-07",3418,"confirmed"),
(103,3,300,"2024-03-07","2024-03-08",2100,"pending"),
(104,4,400,"2024-03-08","2024-03-09",3300,"confirmed"),
(105,5,500,"2024-03-09","2024-03-10",2500,"completed");

select * from reservation;

---- 4. Admin Table: ----
CREATE TABLE Admin (
    AdminID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50),
    Email VARCHAR(100) UNIQUE NOT NULL,
    PhoneNumber VARCHAR(20) UNIQUE NOT NULL,
    Username VARCHAR(50) UNIQUE NOT NULL,
    Password VARCHAR(255) NOT NULL,
    Role VARCHAR(50) NOT NULL,
    JoinDate DATE NOT NULL
);
insert into admin values(501,'John', 'Doe', 'john.doe@gmail.com', '1234567890', 'johndoe', 'johndoe123', 'Super Admin', '2024-02-07'),
(502,'Jane', 'Smith', 'jane.smith@gmail.com', '0987654321', 'janesmith', 'janesmith432', 'Fleet Manager', '2024-02-08'),
(503,'Alice', 'Johnson', 'alice.johnson@gmail.com', '9876543210', 'alicejohnson', 'alicejohnson173', 'System Administrator', '2024-02-09'),
(504,'Bob', 'Brown', 'bob.brown@gmail.com', '4567890123', 'bobbrown', 'bobbrown754', 'Manager', '2024-02-10'),
(505,'Emily', 'Wilson', 'emily.wilson@gmail.com', '7890123456', 'emilywilson', 'emilywilson654', 'Assistant', '2024-02-11');

select * from admin;


drop table admin;
drop table reservation;
drop table vehicle;
drop table customer;
 


