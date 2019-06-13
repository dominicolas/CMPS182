SELECT c.customerID, c.totalClearedPayments, COUNT(DISTINCT s.productID) AS numDiffProducts
FROM ClearedPayments c, Sales s, Products p, Customers cust
WHERE c.customerID = s.customerID
AND s.productID = p.productID
AND c.totalClearedPayments > cust.amountOwed
GROUP BY c.customerID, c.totalClearedPayments
HAVING COUNT (DISTINCT s.productID) >= 3;

---Great Customer Output
---customerID | totalclearedpayments | numdiffproucts 
--------------|----------------------|---------------
--        1001|                269.11|              5
--        1002|                364.56|              5
--        1004|                494.40|              3
--        1005|                249.99|              3


DELETE 
FROM Payments 
WHERE customerID = 1002 
AND paidDate = DATE '2018-02-19';

DELETE 
FROM Payments
WHERE customerID = 1004 AND paidDate = DATE '2018-02-04';

---Great Customer Output                                                        
---customerID | totalclearedpayments | numdiffproucts                           
--------------|----------------------|---------------                           
--        1001|                269.11|              5                        
--        1005|                249.99|              3                           


