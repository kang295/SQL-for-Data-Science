-- How many albums does the artist Led Zeppelin have? 
SELECT 
Name, COUNT(Title)
FROM artists

LEFT JOIN albums
ON artists.ArtistId = albums.ArtistId
WHERE artists.Name='Led Zeppelin'

-- Create a list of album titles and the unit prices for the artist "Audioslave".
SELECT 
artists.Name,
Title AS [Album Titles], 
UnitPrice
FROM artists

LEFT JOIN albums
ON artists.ArtistId = albums.ArtistId
LEFT JOIN tracks
ON albums.AlbumId = tracks.AlbumId
WHERE artists.Name='Audioslave'

-- Find the first and last name of any customer who does not have an invoice. Are there any customers returned from the query?  
SELECT 
LastName,
FirstName,
customers.customerId AS cID,
COUNT(invoices.invoiceID) AS invcnt
FROM customers

LEFT JOIN invoices
ON customers.CustomerId = invoices.CustomerId
GROUP BY cID
ORDER BY invcnt ASC

-- Find the total price for each album. What is the total price for the album “Big Ones”?
SELECT
albums.Title,
SUM(tracks.UnitPrice) AS total
FROM albums

LEFT JOIN tracks
ON albums.AlbumId = tracks.AlbumId
WHERE albums.Title = 'Big Ones'

-- How many records are created when you apply a Cartesian join to the invoice and invoice items table?
SELECT
invoices.InvoiceId
FROM invoices

CROSS JOIN invoice_items

-- Using a subquery, find the names of all the tracks for the album "Californication".
SELECT 
Name,
AlbumId
FROM Tracks
WHERE AlbumId IN 
(SELECT AlbumId 
FROM Albums
WHERE Title = 'Californication')

-- Find the total number of invoices for each customer along with the customer's full name, city and email.
SELECT 
FirstName,
LastName,
City,
Email,
COUNT(C.CustomerId) AS Invoices
FROM Customers C INNER JOIN Invoices I
ON C.CustomerId = I.CustomerId
GROUP BY C.CustomerId

-- Retrieve the track name, album, artistID, and trackID for all the albums.
SELECT
Albums.Title AS Album,
Artists.Name AS Artist,
Tracks.Name,
Tracks.TrackId


FROM((Tracks INNER JOIN Albums
ON Albums.AlbumId = Tracks.AlbumId)
INNER JOIN Artists
ON Artists.ArtistId = Albums.ArtistId)

-- Retrieve a list with the managers last name, and the last name of the employees who report to him or her.
SELECT
M.LastName AS Manager,
E.LastName AS Employee
FROM Employees E 
INNER JOIN Employees M
ON E.ReportsTo = M.EmployeeId

-- Find the name and ID of the artists who do not have albums. 
SELECT
Albums.Title AS Album,
Artists.ArtistId,
Name AS Artist
FROM Artists LEFT JOIN Albums
ON Artists.ArtistId = Albums.ArtistId
WHERE Album IS NULL

-- Use a UNION to create a list of all the employee's and customer's first names and last names ordered by the last name in descending order.
SELECT
FirstName,
LastName
FROM Employees

UNION

SELECT
FirstName,
LastName
FROM Customers
ORDER BY LastName DESC

-- See if there are any customers who have a different city listed in their billing city versus their customer city.
SELECT
C.FirstName,
C.LastName,
C.City AS CustomerCity,
I.BillingCity
FROM Customers C
INNER JOIN Invoices I
ON C.CustomerId = I.CustomerId

Where CustomerCity != BillingCity

