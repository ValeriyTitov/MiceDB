CREATE OR ALTER PROCEDURE [dbo].[spui_AppGetPluginUnusedCommonCmd] @AppPluginsId int
AS
BEGIN
  SELECT 
        c.AppCmdID,
		c.Caption,
        c.ImageIndex,
		c.iType
  FROM AppCmd c WITH (NOLOCK)
  WHERE iType IN (6,8)  AND c.Active=1
  AND c.AppCmdID NOT IN (SELECT AppCmdId
                         FROM AppPluginsCommonCmd WITH (NOLOCK)
                         WHERE AppPluginsId=@AppPluginsId)
 END

GO


