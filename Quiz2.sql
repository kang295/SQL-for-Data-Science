-- Find all the tracks that have a length of 5,000,000 milliseconds or more.
SELECT 
count(TrackId)
FROM Tracks
Where Milliseconds >= 5000000;

-- Find all the invoices whose total is between $5 and $15 dollars.
SELECT 
invoiceID
FROM Invoices
Where Total between 5 and 15;

-- Find all the customers from the following States: RJ, DF, AB, BC, CA, WA, NY.
SELECT 
Company,
FirstName,
LastName,
State
FROM Customers
where State IN ('RJ','DF', 'AB', 'BC', 'CA', 'WA', 'NY')

-- Find all the invoices for customer 56 and 58 where the total was between $1.00 and $5.00.
SELECT 
CustomerID,
Total,
InvoiceId,
InvoiceDate
FROM Invoices
Where customerID IN (56,58) and (total between 1 and 5)

-- Find all the tracks whose name starts with 'All'.
SELECT
Name
FROM Tracks
Where Name like 'All%'

-- Find all the customer emails that start with "J" and are from gmail.com.
SELECT
Email
FROM Customers
where Email like 'J%@gmail.com'

-- Find all the invoices from the billing city Brasília, Edmonton, and Vancouver and sort in descending order by invoice ID.
SELECT
InvoiceId,
BillingCity,
Total
FROM Invoices
where BillingCity in ('Brasília', 'Edmonton', 'Vancouver')
ORDER BY InvoiceId DESC

-- Show the number of orders placed by each customer (hint: this is found in the invoices table) and sort the result by the number of orders in descending order.
SELECT
CustomerId,
count(*) AS NumofOrders
FROM Invoices
GROUP BY CustomerId
ORDER BY NumofOrders DESC

-- Find the albums with 12 or more tracks.
SELECT
AlbumId,
count(*) AS NumofTracks
FROM Tracks
GROUP BY AlbumId
Having NumofTracks >= 12
ORDER BY NumofTracks DESC
