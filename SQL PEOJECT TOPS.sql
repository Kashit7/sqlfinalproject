use  oil;
create table drivers
(
driverID int primary key not null,
driverName varchar(20) not null,
driverContactNUm varchar(20),
vehicleType enum("bike","auto","Economycar","premiumCar","CabXl") not null,
vehicleNumber varchar(20) not null,
availableStatus enum("available","not available")
)
;
insert into drivers(driverID,driverName,driverContactNum,vehicleType,vehicleNumber,availableStatus)
values(101,"raj",4567892356,"bike",4567,"available"),
      (102,"tom",7897495456,"auto",8989,"not available"),
	  (103,"jerry",4566782356,"CabXl",5566,"available"),
      (104,"alex",9999892356,"premiumCar",8833,"not available");

select * from drivers;

create table passenger
(
passengerID int primary key not null,
passengerName varchar(20) not null,
passengerContactNUm varchar(20) not null,
locationOFPassenger varchar(20) not null
)
;

insert into passenger(passengerID,passengerName,passengerContactNum,locationOFPassenger)
values(201,"ria",4567232356,"surat"),
      (202,"tina",7897775456,"vadodara"),
	  (203,"jia",4563332356,"rajkot"),
      (204,"alia",9999542356,"ahmedabad");

select * from passenger;

create table Trip
(
TripID int primary key not null,
pickupLocation varchar(20) not null,
ArrivalTime varchar(20),
Droplocation varchar(20) not null,
TripStatus enum("pending","ongoing","arrived","completed","cancelled"),
price int not null,
driverID int,
passengerId int,
foreign key (driverID) references drivers(driverID),
foreign key (passengerId) references passenger(passengerID)
)
;

insert into Trip(TripID,pickupLocation,ArrivalTime,Droplocation,TripStatus,price,driverID,passengerId)
VALUES (301,"RAJ CHOWK","7-30PM","MANINAGAR","COMPLETED",70,101,202),
       (302,"RANIP","5-30PM","KANKARIA","COMPLETED",110,103,204),
       (303,"SGHIGHWAY","2-30PM","VASTRAPUR","COMPLETED",250,104,203),
       (304,"PRAHLADNAAGR","9-30PM","SATELITE","COMPLETED",350,102,201);


select * from Trip;

create table payment1
(
paymentID int primary key not null,
paymentType varchar(20) not null,
paymentStatus enum("pending","paid","Failed"),
tripid int,
foreign key (tripid) references Trip(TripID)
)
;
INSERT INTO payment1(paymentID,paymentType,paymentStatus,tripid)
values(401,"cash","paid",303),
	  (402,"upi","Failed",301),
      (403,"online","paid",302),
      (404,"credit","pending",304);
select * from drivers where availableStatus="available";
select passengerName,passengerContactNUm,locationOFPassenger,driverName,driverContactNUm,vehicleType,availableStatus,pickupLocation,ArrivalTime,Droplocation,TripStatus,price from Trip inner join drivers on Trip.driverID=drivers.driverID inner join passenger on Trip.passengerId=passenger.passengerID;
select * from payment1 inner join Trip on payment1.TripID=Trip.TripID;
select passengerName,passengerContactNUm,driverName,driverContactNUm,pickupLocation,Droplocation,TripStatus,paymentStatus,paymentType,price from Payment1 inner join Trip on payment1.TripID=Trip.TripID inner join drivers on Trip.driverID=drivers.driverID inner join passenger on Trip.passengerId=passenger.passengerID;

