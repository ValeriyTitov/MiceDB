CREATE OR ALTER PROCEDURE [dbo].[spui_AppGetPluginCommands] @AppPluginsId int
AS
BEGIN
SET NOCOUNT ON
 
 DECLARE @Tmp TABLE (AppCmdId int PRIMARY KEY)
 
 INSERT INTO @Tmp
 SELECT a.AppCmdId
 FROM AppCmd a WITH (NOLOCK)
 WHERE (a.AppPluginsId=@AppPluginsId) AND (a.Active=1)

 INSERT INTO @Tmp
 SELECT a.AppCmdId
 FROM AppPluginsCommonCmd a WITH (NOLOCK)
 WHERE (a.AppPluginsId=@AppPluginsId)
 
 SELECT *
 FROM @Tmp t
 INNER JOIN AppCmd a WITH (NOLOCK) ON a.AppCmdId=t.AppCmdId
 WHERE a.Active=1
 ORDER BY CreateOrder, CommandType


 /* 
 SELECT a.*
 FROM AppCmd a WITH (NOLOCK)
 WHERE (a.AppPluginsId=@AppPluginsId) AND (a.Active=1)

 UNION 

 SELECT c.*
 FROM AppPluginsCommonCmd a WITH (NOLOCK)
 INNER JOIN AppCmd c WITH (NOLOCK) ON c.AppCmdID=a.AppCmdID
 WHERE (a.AppPluginsId=@AppPluginsId) AND (c.Active=1)
 ORDER BY CreateOrder, CommandType
 */
END

GO


