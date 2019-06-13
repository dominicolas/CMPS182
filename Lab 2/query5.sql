SELECT DISTINCT c.customerID, c.address, s.paidprice*s.quantity 
AS theRevenue
FROM Sales s, Customers c
WHERE s.customerID = c.customerID
AND c.status = 'H'
AND s.paidprice*s.quantity >=200.00
AND c.address<>'\N'; 
