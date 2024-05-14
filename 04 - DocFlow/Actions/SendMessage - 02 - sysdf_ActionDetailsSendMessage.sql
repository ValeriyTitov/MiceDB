CREATE OR ALTER PROCEDURE sysdf_ActionDetailsSendMessage @dfPathFolderActionsId int
 AS 
  BEGIN
   SELECT *
   FROM dfActionsMessages d WITH (NOLOCK)
   WHERE d.dfPathFolderActionsId=@dfPathFolderActionsId
  END
GO