CREATE OR ALTER PROCEDURE [dbo].[spui_AppUpdateUseOnMainTree] @AppMainTreeId int, @UseOnMainTree bit
AS
BEGIN
 UPDATE AppMainTree
 SET UseOnMainTree = @UseOnMainTree
 WHERE AppMainTreeId = @AppMainTreeId
END


GO


