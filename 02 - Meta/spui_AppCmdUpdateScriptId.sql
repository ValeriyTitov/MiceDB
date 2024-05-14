CREATE OR ALTER PROCEDURE [dbo].[spui_AppCmdUpdateScriptId] @AppCmdID int, @RunAppScriptsID int
AS
BEGIN
 UPDATE AppCmd
 SET RunAppScriptsID = @RunAppScriptsID
 WHERE AppCmdID=@AppCmdID
END

GO


