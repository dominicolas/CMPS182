DROP SCHEMA Lab2 CASCADE;
CREATE SCHEMA Lab2; 

    CREATE TABLE Products (
        productID INTEGER PRIMARY KEY,
        productName VARCHAR(40),
        manuf VARCHAR(40),
        normalPrice DECIMAL(5, 2) NOT NULL,
        discount INTEGER,
	UNIQUE (productName, manuf)
    );

    CREATE TABLE Customers (
        customerID INTEGER PRIMARY KEY, 
        custName VARCHAR(40) NOT NULL, 
        address VARCHAR(40), 
        joinDate DATE, 
        amountOwed DECIMAL(6, 2), 
        lastPaidDate DATE, 
        status CHAR(1),
	UNIQUE (custName, address)
    );

    CREATE TABLE Stores (
        storeID INTEGER PRIMARY KEY, 
        storeName VARCHAR(40) NOT NULL, 
        region CHAR(5), 
        address VARCHAR(40), 
        manager VARCHAR(40),
	UNIQUE (storeName)
    );

    CREATE TABLE Days(
        dayDate DATE PRIMARY KEY, 
        category CHAR(1)
    );


    CREATE TABLE Sales(
        productID INTEGER, 
        customerID INTEGER, 
        storeID INTEGER, 
        dayDate DATE, 
        paidPrice DECIMAL(5, 2), 
        quantity INTEGER,
        PRIMARY KEY (productID, customerID, storeID, dayDate)
    );

    CREATE TABLE Payments(
        customerID INTEGER, 
        custName VARCHAR(40), 
        paidDate DATE, 
        amountPaid DECIMAL(6, 2), 
        cleared BOOLEAN,
        PRIMARY KEY (customerID, paidDate)
    );
