EXEC tsqlt.NewTestClass 'Func_ProductTest'
GO
CREATE OR ALTER PROCEDURE Func_ProductTest.[test GetProductName casewhen1withfaketable  Expected_Mango]
AS
DECLARE @Expected AS VARCHAR(100)='Mango'
DECLARE @Actual AS VARCHAR(100)
EXEC tSQLt.FakeTable 'Tbl_TestName'
INSERT INTO Tbl_TestName VALUES (1,'Watermelon')
INSERT INTO Tbl_TestName VALUES (2,'Grape')
INSERT INTO Tbl_TestName VALUES (3,'Mango')
SELECT @Actual = dbo.GetProductName(1)
EXEC tSQLt.AssertEquals @Expected,@Actual
GO
 
CREATE OR ALTER PROCEDURE Func_ProductTest.[test GetProductName casewhen2 Expected_Tomato]
AS
DECLARE @Expected AS VARCHAR(100)='Tomato'
DECLARE @Actual AS VARCHAR(100)
SELECT @Actual = dbo.GetProductName(2)
EXEC tSQLt.AssertEquals @Expected,@Actual
GO
 
CREATE OR ALTER PROCEDURE Func_ProductTest.[test GetProductName casewhen3 Expected_Banana]
AS
DECLARE @Expected AS VARCHAR(100)='Banana'
DECLARE @Actual AS VARCHAR(100)
SELECT @Actual = dbo.GetProductName(3)
EXEC tSQLt.AssertEquals @Expected,@Actual
GO
CREATE OR ALTER PROCEDURE Func_ProductTest.[test GetProductName casewhenelse Expected_NotFound]
AS
DECLARE @Expected AS VARCHAR(100)='Not Found'
DECLARE @Actual AS VARCHAR(100)
SELECT @Actual = dbo.GetProductName(4)
EXEC tSQLt.AssertEquals @Expected,@Actual
GO
 
EXEC tSQLt.Run 'Func_ProductTest'
