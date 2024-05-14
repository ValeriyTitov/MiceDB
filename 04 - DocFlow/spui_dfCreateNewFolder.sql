CREATE OR ALTER PROCEDURE [dbo].[spui_dfCreateNewPathFolder] @dfPathFoldersId int, @dfClassesId int, @dfTypesId int, @Caption VARCHAR(255), @FolderType int
AS
BEGIN
 INSERT INTO dfPathFolders ([dfPathFoldersId],[dfClassesId],[dfTypesId], [Caption], [FolderType])
 VALUES                    (@dfPathFoldersId, @dfClassesId, @dfTypesId,  @Caption , @FolderType )
END


GO


