CREATE OR ALTER PROCEDURE [dbo].[spui_dfDeletePathFolder] @dfPathFoldersId int
AS
BEGIN
 DELETE dfPathFolders 
 WHERE dfPathFoldersId=@dfPathFoldersId
END


GO


