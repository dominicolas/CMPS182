--Tests for ALTER TABLE Sales ADD FOREIGN KEY (productID) REFERENCES Products(productID);
INSERT INTO Sales VALUES(112,1001,1,'2018-01-16',18.91,9);

--Tests for ALTER TABLE Sales ADD FOREIGN KEY (customerID) REFERENCES Customers(customerID);
INSERT INTO Sales VALUES(102,1007,3,'2018-01-18',73.10,7);

--Tests for ALTER TABLE Sales ADD FOREIGN KEY (storeID) REFERENCES Stores(storeID); 
INSERT INTO Sales VALUES(103,1001,5,'2018-01-11',96.71,9);

--Tests for ALTER TABLE Sales ADD FOREIGN KEY (dayDate) REFERENCES Days(dayDate);
INSERT INTO Sales VALUES(104,1001,2,'2018-01-02',47.00,7);

--Tests for ALTER TABLE Payments ADD FOREIGN KEY (customerID) REFERENCES Customers(customerID); 
INSERT INTO Payments VALUES(1104,'India Crona','2018-02-19',12.32,'t'); 

--Updates Customers, will update since amountOwed is greater than or equal to 0
UPDATE Customers
SET amountOwed = 13
WHERE customerID = 1001
AND custName = 'Ami Maggio';

--Updates Customers, will update since amoundOwed is less than 0
UPDATE Customers 
SET amountOwed = -1
WHERE customerID = 1001
AND custName = 'Ami Maggio';

--Updates Sales, will update since revenue is equal to or greater than 10.00
UPDATE Sales 
SET paidPrice = 132.00,
    quantity = 2
WHERE productID = 101;

--Updates Sales, will not update since revenue is less than 10.00
UPDATE Sales 
SET paidPrice = 132.00,
    quantity = 0
WHERE productID = 101;

--Updates Customers, will update since lastPaidDate is NULL
UPDATE Customers 
SET lastPaidDate = NULL,
    status = 'L'  
WHERE customerID = 1103;

--Updates Customers, will not update since lastPaidDate is NOT NULL 
UPDATE Customers 
SET   lastPaidDate = NULL,
      status = 'H'
WHERE customerID = 1103;
