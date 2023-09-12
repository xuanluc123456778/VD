USE AdventureWorks2022
GO
CREATE PROCEDURE sp_DisplayEmployeesHireYear
@HireYear int
AS
SELECT * FROM HumanResources.Employee
WHERE DATEPART(YY, HireDate)=@HireYear
GO
EXECUTE sp_DisplayEmployeesHireYear 2003
GO
CREATE PROCEDURE sp_EmployeesHireYearCount
@HireYear int,
@Count int OUTPUT
AS
SELECT @Count=COUNT(*) FROM HumanResources.Employee
WHERE DATEPART(YY, HireDate)=@HireYear
GO
DECLARE @Number int
EXECUTE sp_EmployeesHireYearCount 2003, @Number OUTPUT
PRINT @Number
GO
CREATE PROCEDURE sp_EmployeesHireYearCount2
@HireYear int
AS
DECLARE @Count int
SELECT @Count=COUNT(*) FROM HumanResources.Employee
WHERE DATEPART(YY, HireDate)=@HireYear
RETURN @Count
GO
DECLARE @Number int
EXECUTE @Number = sp_EmployeesHireYearCount2 2003
PRINT @Number
GO
CREATE TABLE #Students
(
RollNo varchar(6) CONSTRAINT PK_Students PRIMARY KEY,
FullName nvarchar(100),
Birthday datetime constraint DF_StudentsBirthday DEFAULT 
DATEADD(yy, -18, GETDATE())
)
GO
CREATE PROCEDURE #spInsertStudents
@rollNo varchar(6),
@fullName nvarchar(100),
@birthday datetime
AS BEGIN
IF(@birthday IS NULL)
SET @birthday=DATEADD(YY, -18, GETDATE())
INSERT INTO #Students(RollNo, FullName, Birthday)
VALUES(@rollNo, @fullName, @birthday)
END
GO
EXEC #spInsertStudents 'A12345', 'abc', NULL
EXEC #spInsertStudents 'A54321', 'abc', '24/12/2011'
SELECT * FROM #Students
CREATE PROCEDURE #sptDeleteStudents
@rollNo varchar(6)
AS BEGIN
DELETE FROM #Students WHERE RollNo=@rollNo
END
EXECUTE #sptDeleteStudents 'A12345'
GO
CREATE PROCEDURE Cal_Square @num int=0 AS
BEGIN
RETURN (@num * @num);
END
GO
DECLARE @square int;
EXEC @square = Cal_Square 10;
PRINT @square;
GO
SELECT 
OBJECT_DEFINITION(OBJECT_ID('HumanResources.uspUpdateEmployeePersonalI
nfo')) AS DEFINITION
SELECT definition FROM sys.sql_modules
WHERE 
object_id=OBJECT_ID('HumanResources.uspUpdateEmployeePersonalInfo')
GO
sp_depends 'HumanResources.uspUpdateEmployeePersonalInfo'
GO
