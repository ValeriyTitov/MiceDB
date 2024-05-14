CREATE OR ALTER PROCEDURE [dbo].[spui_AppGetScript] @AppScriptsId int
AS
BEGIN
 SELECT *
 FROM AppScripts s WITH (NOLOCK) 
 WHERE AppScriptsId=@AppScriptsId
END


GO


