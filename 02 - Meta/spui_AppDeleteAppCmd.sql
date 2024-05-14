CREATE OR ALTER PROCEDURE [dbo].[spui_AppDeleteAppCmd] @AppCmdID int
AS
BEGIN
 DELETE AppCmd
 WHERE AppCmdID=@AppCmdID
END

GO


