SELECT DISTINCT Stores.storeName, Sales.dayDate
FROM Sales INNER JOIN Stores
ON Sales.storeID = Stores.storeID
GROUP BY Stores.storeName, Sales.dayDate  
