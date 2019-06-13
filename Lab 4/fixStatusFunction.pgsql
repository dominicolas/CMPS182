CREATE OR REPLACE FUNCTION fixStatusFunction (lowCustomerID integer) RETURNS integer AS $$

DECLARE 
strongCustID INTEGER;
customerStatus CHAR(1);
statusCounter1 INTEGER;
statusCounter2 INTEGER;
statusCounter3 INTEGER;
statusChangeCount INTEGER; 

DECLARE strongCustomerCursor CURSOR FOR 
SELECT c.customerID
FROM Customers c, Payments p
WHERE c.customerID = p.customerID
AND c.customerID >= lowCustomerID
GROUP BY c.customerID
HAVING SUM(p.amountPaid) >= c.amountOwed;

BEGIN 
statusCounter1 := 0;
statusCounter2 := 0;
statusCounter3 := 0;
statusChangeCount := 0;

OPEN strongCustomerCursor;

LOOP
   FETCH strongCustomerCursor INTO strongCustID;
   EXIT WHEN NOT FOUND;

   SELECT status INTO customerStatus
   FROM Customers c
   WHERE customerID = strongCustID;

UPDATE Customers
SET status = 'L'
WHERE customerStatus IS NULL 
AND customerID = strongCustID;

GET DIAGNOSTICS statusCounter1 = ROW_COUNT;
statusChangeCount := statusCounter1 + statusChangeCount; 

UPDATE Customers
SET STATUS = 'M'
WHERE customerStatus = 'L'
AND customerID = strongCustID; 

GET DIAGNOSTICS statusCounter2 = ROW_COUNT;
statusChangeCount := statusCounter2 + statusChangeCount; 

UPDATE Customers
SET status = 'H'
WHERE customerStatus = 'M'
AND customerID = strongCustID;

GET DIAGNOSTICS statusCounter3 = ROW_COUNT;
statusChangeCount := statusCounter3 + statusChangeCount; 


END LOOP;

CLOSE strongCustomerCursor;

RETURN statusChangeCount;

END;
$$ LANGUAGE plpgsql;