/* Core SQL Queries
Write queries using:
SELECT, WHERE, ORDER BY
GROUP BY, HAVING
Aggregate functions (SUM, AVG, COUNT)

3. Advanced SQL Concepts
- Joins (INNER, LEFT, RIGHT)
Subqueries
- Window functions (ROW_NUMBER, RANK, PARTITION BY)

4. Business Problem Solving
Answer key analytical questions such as:
- Top-performing products or customers
Revenue trends over time
- Customer purchasing behavior 
5. Query Optimization
Improve performance using indexing concepts
Write clean and readable SQL */

USE [Chinook];
-- Total revenue trend
SELECT 
    YEAR(i.InvoiceDate) AS Year,
    MONTH(i.InvoiceDate) AS Month,
    SUM(i.Total) AS MonthlyRevenue
FROM dbo.Invoice i
GROUP BY YEAR(i.InvoiceDate), MONTH(i.InvoiceDate)
ORDER BY SUM(i.Total) DESC;
-- Revenue by genre (SUM, COUNT, AVG)
SELECT 
    g.Name AS Genre,
    COUNT(t.TrackId) AS TrackCount,
    SUM(il.Quantity) AS TotalUnitsSold,
    AVG(t.UnitPrice) AS AvgTrackPrice,
    SUM(il.Quantity * il.UnitPrice) AS TotalRevenue
FROM Genre g
INNER JOIN Track t ON g.GenreId = t.GenreId
INNER JOIN InvoiceLine il ON t.TrackId = il.TrackId
GROUP BY g.Name
HAVING COUNT(t.TrackId) > 5
ORDER BY TotalRevenue DESC;

-- Sales By Country
SELECT 
    i.BillingCountry,
    SUM(i.Total) AS CountrySales,
    COUNT(DISTINCT i.CustomerId) AS UniqueCustomers
FROM dbo.Invoice i
GROUP BY i.BillingCountry
ORDER BY CountrySales DESC;

--Customers with more than 5 purchases
SELECT 
    c.CustomerId,
    c.FirstName,
    c.LastName,
    COUNT(i.InvoiceId) AS PurchaseCount,
    SUM(i.Total) AS TotalSpent,
    AVG(i.Total) AS AvgOrderValue
FROM dbo.Customer c
INNER JOIN Invoice i ON c.CustomerId = i.CustomerId
GROUP BY c.CustomerId, c.FirstName, c.LastName
HAVING COUNT(i.InvoiceId) > 5
ORDER BY TotalSpent DESC;

-- Popular genres by region
SELECT 
    i.BillingCountry,
    g.Name AS GenreName,
    SUM(il.Quantity) AS UnitsSold,
    SUM(il.UnitPrice * il.Quantity) AS GenreRevenue,
    ROW_NUMBER() OVER (PARTITION BY i.BillingCountry ORDER BY SUM(il.UnitPrice * il.Quantity) DESC) AS PopularityRank
FROM dbo.Invoice i
JOIN dbo.InvoiceLine il ON i.InvoiceId = il.InvoiceId
JOIN dbo.Track t ON il.TrackId = t.TrackId
JOIN dbo.Genre g ON t.GenreId = g.GenreId
GROUP BY i.BillingCountry, g.Name
ORDER BY i.BillingCountry, GenreRevenue DESC;

-- Artist and album success
SELECT 
    a.Name AS ArtistName,
    al.Title AS AlbumTitle,
    SUM(il.UnitPrice * il.Quantity) AS AlbumRevenue,
    COUNT(DISTINCT il.InvoiceId) AS SaleCount
FROM dbo.Artist a
JOIN dbo.Album al ON a.ArtistId = al.ArtistId
JOIN dbo.Track t ON al.AlbumId = t.AlbumId
JOIN dbo.InvoiceLine il ON t.TrackId = il.TrackId
GROUP BY a.Name, al.Title
ORDER BY AlbumRevenue DESC;



