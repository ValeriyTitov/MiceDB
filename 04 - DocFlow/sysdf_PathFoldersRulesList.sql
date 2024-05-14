CREATE OR ALTER PROCEDURE [dbo].[sysdf_PathFoldersRulesList] @dfPathFoldersId int
AS
BEGIN
 SELECT *
 FROM dfPathFolderRules r WITH (NOLOCK)
 WHERE r.dfPathFoldersId=@dfPathFoldersId
  AND  r.Active=1
 ORDER BY r.OrderId
END

GO


