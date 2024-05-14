CREATE OR ALTER PROCEDURE [dbo].[sysdf_PathFoldersActionList] @dfPathFoldersId int
AS
BEGIN
 SELECT *
 FROM dfPathFolderActions f WITH (NOLOCK)
 WHERE f.dfPathFoldersId=@dfPathFoldersId
 ORDER BY f.OrderId
END


GO


