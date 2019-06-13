DROP SCHEMA Lab1 CASCADE;
CREATE SCHEMA Lab1;

CREATE TABLE Products (

productID integer,
productNAME CHAR(1),
manuf VARCHAR(40),
normalPrice DECIMAL (3,2),
discount integer,
PRIMARY KEY (productID)

);

CREATE TABLE Customers (

customerID integer,
custName VARCHAR(40),
address VARCHAR(40),
joinDate date,
amountOwed DECIMAL(4,2),
lastPaidDate date,
status CHAR(1),
PRIMARY KEY (customerID)

);

CREATE TABLE Stores(

storeID integer,
storeName VARCHAR(40),
region CHAR(5),
address VARCHAR(40),
manager VARCHAR(40),
PRIMARY KEY (storeID)

);

CREATE TABLE Days(

dayDate date,
category CHAR(1),
PRIMARY KEY (dayDate)
);

CREATE TABLE Sales(

productID integer, 
customerID integer,
storeID integer,
dayDate date,
paidPrice DECIMAL(3,2),
quantity integer, 
PRIMARY KEY(productID, customerID, storeID, dayDate)

);


CREATE TABLE Payments(

customerID integer,
custName VARCHAR(40),
paidDate date,
amountPaid DECIMAL (4,2),
cleared boolean,
PRIMARY KEY(customerID,paidDate)
);
