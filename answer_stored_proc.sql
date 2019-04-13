/* Assignment - 79
Design a stored procedure that has at least two joins and two parameters.
*/

CREATE PROC dbo.getCITY_INFO @City nvarchar(30) = NULL, @AddressLine1 nvarchar(60) = NULL
AS
SELECT a1.City AS "City Name:", a2.Name AS "State Name:", a3.CountryRegionCode AS "Country:"
FROM Person.Address a1
INNER JOIN Person.StateProvince a2 ON a2.StateProvinceID = a1.StateProvinceID
INNER JOIN Person.CountryRegion a3 ON a3.CountryRegionCode = a2.CountryRegionCode
WHERE City = ISNULL(@City,City)
AND AddressLine1 LIKE '%' + ISNULL(@AddressLine1 ,AddressLine1) + '%'
GO

/* Usage Example: EXEC [dbo].[getCITY_INFO] 'Bothell' */