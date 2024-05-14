CREATE OR ALTER PROCEDURE [dbo].[spui_dfPathFoldersActionList] @dfPathFoldersId int
AS
BEGIN
 SELECT *
 FROM dfPathFolderActions a WITH (NOLOCK)
 WHERE a.dfPathFoldersId=@dfPathFoldersId
 ORDER BY a.OrderId
END

GO


