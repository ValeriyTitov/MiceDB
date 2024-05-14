CREATE OR ALTER PROCEDURE [dbo].[spui_AppFindScript] @Name VARCHAR(20), @Syntax VARCHAR(8)
AS
BEGIN
 SELECT *
 FROM AppScripts s WITH (NOLOCK)
 WHERE Syntax=@Syntax AND [Name]=@Name
END

GO



