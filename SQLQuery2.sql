SELECT * FROM HumanResources.Department

SELECT * FROM Person.Person

SELECT * FROM Production.Product

SELECT * FROM Production.Product;

SELECT * FROM Production.WorkOrder

SELECT * FROM Production.Location

SELECT * FROM Production.ProductInventory

SELECT * FROM Production.ProductSubcategory 

SELECT * FROM Production.ProductCategory

SELECT * FROM Sales.CreditCard
SELECT * FROM Person.Address
SELECT * FROM PERSON.StateProvince


SELECT * FROM Production.Product AS P WHERE P.ProductNumber LIKE 'BE%'
SELECT * FROM Sales.CreditCard AS C WHERE C.ExpYear BETWEEN 2006 AND 2008
SELECT * FROM Person.Person AS P ORDER BY P.FirstName
SELECT * FROM Person.Person AS P WHERE P.PersonType IN('SC', 'EM')
SELECT * FROM Production.Product AS P INNER JOIN Production.WorkOrder AS W ON P.ProductID = W.ProductID
SELECT * FROM Production.ProductInventory AS P LEFT JOIN Production.Location AS L ON P.LocationID = L.LocationID

SELECT  ADDRESSLINE1, CITY, POSTALCODE, StateProvinceID INTO #ADDRESS FROM Person.Address
SELECT StateProvinceCode, COUNTRYREGIONCODE, Name, StateProvinceID INTO #STATE FROM Person.StateProvince

SELECT * FROM #ADDRESS A FULL JOIN #STATE S ON A.StateProvinceID = S.StateProvinceID

SELECT  P.ReorderPoint, COUNT(*) FROM Production.Product AS P GROUP BY P.ReorderPoint HAVING COUNT(*) > 10

UPDATE Person.Person SET Title = 'Mr.' WHERE BusinessEntityID = 5

UPDATE PERSON.Person SET NameStyle = 1

DELETE FROM Production.Product WHERE Size = '48'

DELETE FROM Production.ProductInventory

BEGIN TRY 

BEGIN TRAN 

UPDATE Person.Person SET Title = 'Ms.' WHERE BusinessEntityID = 13
DELETE FROM Person.Person WHERE rowguid IN ('9A7501DE-5CAF-4700-AB07-CC81102BB696', '9EE4713E-B3D8-4409-BC5E-DEC62497F43A', '1E7E56F4-A583-4E3F-A3FE-BA8A71096D10')

COMMIT TRAN 

END TRY 

BEGIN CATCH
PRINT 'OOPS'
IF (@@TRANCOUNT > 0)
ROLLBACK TRAN;
END CATCH
