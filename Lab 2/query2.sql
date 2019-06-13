SELECT DISTINCT productID as theProduct, customerID as theCustomer, storeID as theStore 
FROM Sales
WHERE dayDATE = '2018-01-16%' AND quantity > 5 AND paidPrice > 20.00   
