CREATE OR ALTER PROCEDURE [dbo].[spui_AppGetPluginCommandsMngr] @AppPluginsId int, @AppCmdId int
AS
BEGIN
SET NOCOUNT ON

 SELECT *
 FROM AppCmd a WITH (NOLOCK)
 WHERE (a.AppPluginsId=@AppPluginsId) 
   AND (Active=1)
   AND (iType IN (6,7))
   AND (a.AppCmdID=@AppCmdId OR @AppCmdId IS NULL)
 
 UNION 

 SELECT c.*
 FROM AppPluginsCommonCmd a WITH (NOLOCK)
 INNER JOIN AppCmd c WITH (NOLOCK) ON c.AppCmdId=a.AppCmdId
 
 WHERE (a.AppPluginsId=@AppPluginsId) 
   AND (Active=1)
   AND (iType IN (6,7))
   AND (a.AppCmdId=@AppCmdId OR @AppCmdId IS NULL)
     
END


GO


