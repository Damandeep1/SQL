                            -- PROJECT 1--
--. Get all the details from the person table including email ID, phone
--number and phone number.

SELECT Person.Person.*,Person.EmailAddress.EmailAddress,Person.PersonPhone.PhoneNumber,
Person.PhoneNumberType.PhoneNumberTypeID FROM Person.Person
JOIN Person.EmailAddress
ON Person.Person.BusinessEntityID=Person.EmailAddress.BusinessEntityID
JOIN Person.PersonPhone 
ON Person.Person.BusinessEntityID=Person.PersonPhone .BusinessEntityID
JOIN Person.PhoneNumberType
ON Person.PersonPhone.PhoneNumberTypeID=Person.PhoneNumberType.PhoneNumberTypeID

--b. Get the details of the sales header order made in May 2011
SELECT * FROM Sales.SalesOrderHeader WHERE MONTH(OrderDate)=5 AND YEAR(OrderDate)=2011

--c. Get the details of the sales details order made in the month of May
--2011
SELECT * FROM Sales.SalesOrderDetail JOIN Sales.SalesOrderHeader 
ON Sales.SalesOrderDetail.SalesOrderID=Sales.SalesOrderHeader.SalesOrderID
WHERE MONTH(OrderDate)=5 AND YEAR(OrderDate)=2011

--d. Get the total sales made in may 2011
SELECT SUM(TOTALDUE) AS TOTAL_SALES FROM Sales.SalesOrderHeader WHERE MONTH(OrderDate)=5 AND
YEAR(OrderDate)=2011

--e. Get the total sales made in the year 2011 by month order by
--increasing sales..

SELECT SUM(TOTALDUE) AS TOTAL_SALES, MONTH(ORDERDATE) AS MONTH_ORDER
FROM Sales.SalesOrderHeader WHERE YEAR(OrderDate) =2011
GROUP BY MONTH(OrderDate)
ORDER BY TOTAL_SALES

--f. Get the total sales made to the customer with FirstName='Gustavo'
-- anD LAST NAME ='ACHONG'
SELECT FIRSTNAME ,LASTNAME ,SUM(LINETOTAL) AS TOTAL_SALES FROM Person.Person
JOIN Sales.Customer
ON Person.Person.BusinessEntityID=Sales.Customer.CustomerID
JOIN Sales.SalesOrderHeader
ON Sales.SalesOrderHeader.CustomerID=Sales.Customer.CustomerID
JOIN Sales.SalesOrderDetail
ON Sales.SalesOrderDetail.SalesOrderID=Sales.SalesOrderHeader.SalesOrderID
WHERE Person.Person.FirstName='Gustavo' AND LastName='ACHONG'
GROUP BY Person.Person.FirstName,Person.Person.LastName