CREATE OR ALTER PROCEDURE [dbo].[spui_AppUpdateMainTreeDbName] @AppMainTreeId int, @DBName VARCHAR(32)
AS
BEGIN
 UPDATE AppMainTree
 SET DBName = @DBName
 WHERE AppMainTreeId = @AppMainTreeId
END


GO


