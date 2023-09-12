USE AdventureWorks2022
Go
CREATE PROCEDURE Display_Customers 
AS 
SELECT CustomerID, AccountNumber, AccountNumber, rowguid, ModifiedDate 
from Sales.Customer 
EXECUTE Display_Customers
EXECUTE xp_fileexist 'c:\myTest.txt'
EXECUTE sys.sp_who 
CREATE TABLE Toys (
    ToyID INT PRIMARY KEY,
    ToyName NVARCHAR(255),
    WeightInGrams INT,
    Price DECIMAL(10, 2),
    QtyOnHand INT
);
INSERT INTO Toys (ToyID, ToyName, WeightInGrams, Price, QtyOnHand)
VALUES
    (1, 'Toy1', 600, 15.99, 25),
    (2, 'Toy2', 700, 12.99, 22),
    (3, 'Toy3', 300, 9.99, 30),

    (17, 'Toy17', 450, 8.49, 28),
    (18, 'Toy18', 550, 11.79, 21),
    (19, 'Toy19', 400, 14.29, 24),
    (20, 'Toy20', 750, 17.99, 26);
	select*from Toys
CREATE PROCEDURE HeavyToys
AS
BEGIN
    SELECT *
    FROM Toys
    WHERE WeightInGrams > 500;
END;
GO
CREATE PROCEDURE PriceIncrease
AS
BEGIN
    UPDATE Toys
    SET Price = Price + 10;
END;
GO
CREATE PROCEDURE QtyOnHandDecrease
AS
BEGIN
    UPDATE Toys
    SET QtyOnHand = QtyOnHand - 5;
END;

EXEC HeavyToys;

EXEC PriceIncrease;

EXEC QtyOnHandDecrease;
GO