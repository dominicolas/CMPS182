CREATE VIEW ClearedPayments AS
SELECT customerID, SUM(amountPaid) AS totalClearedPayments 
FROM Payments
WHERE cleared = TRUE
GROUP BY customerID;
SELECT * FROM ClearedPayments  
