BEGIN TRANSACTION; 
SET TRANSACTION READ WRITE ISOLATION LEVEL SERIALIZABLE;

UPDATE CUSTOMERS 
SET custName = n.custName,
    address = n.address,
    joinDate = n.joinDate,
    amountOwed = 0,
    status = 'L'

FROM NewCustomers n 
WHERE Customers.customerID = n.customerID;

INSERT INTO Customers (customerID, custName, address, joinDate, amountOwed, lastPaidDate, status)
SELECT n.customerID, n.Custname, n.address, n.joinDate, 0, NULL, 'L'
FROM NewCustomers n 
WHERE NOT EXISTS (SELECT *
      	  	  FROM Customers c 
		  WHERE c.customerID = n.customerID
		  );

COMMIT;
