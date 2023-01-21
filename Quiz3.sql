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
