-- Retrieve all the data from the tracks table. Who is the composer for track 18?
Select *
From Tracks;

-- Retrieve all data from the artists table. Look at the list of artists, how many artists are you familiar with (there is no wrong answer here)?
Select *
From Artists;

-- Retrieve all data from the invoices table. What is the billing address for customer 31?
Select *
From Invoices;

-- Return the playlist id, and name from the playlists table. How many playlists are there? Which would you classify is your favorite from this list?
Select Playlistid,
Name
From Playlists;

-- Return the Customer Id, Invoice Date, and Billing City from the Invoices table. What city is associated with Customer ID number 42? What was the invoice date for the customer in Santiago?
Select CustomerId,
InvoiceDate, 
BillingCity 
From Invoices;

-- Return the First Name, Last Name, Email, and Phone, from the Customers table. What is the telephone number for Jennifer Peterson?
Select FirstName, 
LastName, 
Email, 
Phone
From Customers;

-- Return the Track Id, Genre Id, Composer, Unit Price from the Tracks table. How much do these tracks cost?
Select TrackId, 
GenreId, 
Composer, 
UnitPrice 
From Tracks;

-- Select all the columns from the Playlist Track table and limit the results to 10 records. How might this information be used?
Select *
From Playlist_track 
Limit 10;

-- Select all the columns from the Media Types table and limit the results to 50 records. What happened when you ran this query? Were you able to get all 50 records?
Select *
From Media_types
Limit 10;

-- Select all the columns from the Albums table and limit the results to 5 records. How many columns are in the albums table? 
Select *
From Albums;
Limit 5;

