-- Pull a list of customer ids with the customer’s full name, and address, along with combining their city and country together. Be sure to make a space in between these two and make it UPPER CASE. (e.g. LOS ANGELES USA)
SELECT
CustomerId,
FirstName,
LastName,
Address,
UPPER(City ||' '|| Country) As CityCountry
From Customers

-- Create a new employee user id by combining the first 4 letters of the employee’s first name with the first 2 letters of the employee’s last name. Make the new field lower case and pull each individual step to show your work.
SELECT
FirstName,
LastName,
LOWER(SUBSTR(FirstName, 1,4) ||
SUBSTR(LastName, 1,2)) AS NewUserId
FROM Employees

-- Show a list of employees who have worked for the company for 15 or more years using the current date function. Sort by lastname ascending.
SELECT
FirstName,
LastName,
HireDate,
(STRFTIME('%Y', 'now')-STRFTIME('%Y', HireDate)) AS HowLong
FROM Employees
ORDER BY LastName ASC

-- Profiling the Customers table, answer the following question.
SELECT 
COUNT(*)
FROM Customers
WHERE [ColumnName_Input] IS NULL

-- Find the cities with the most customers and rank in descending order.
SELECT
COUNT(CustomerId) AS C,
City
FROM Customers
GROUP BY City
ORDER BY C DESC

-- Create a new customer invoice id by combining a customer’s invoice id with their first and last name while ordering your query in the following order: firstname, lastname, and invoiceID.
SELECT
FirstName,
LastName,
InvoiceId,
FirstName||LastName||InvoiceId
FROM Customers C INNER JOIN Invoices I
ON C.CustomerId = I.CustomerId
WHERE FirstName LIKE 'Ast%'