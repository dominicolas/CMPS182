SELECT C.customerID, C.custName
FROM Customers C, Stores S, Sales Sale
WHERE C.customerID = Sale.customerID 
AND S.storeID = Sale.storeID
AND S.region = 'North' 
GROUP BY C.customerID
HAVING COUNT (DISTINCT Sale.productID) >= 2; 
