CREATE OR ALTER PROCEDURE [dbo].[spui_AppGetPlugin] @AppPluginsId int
AS
BEGIN
 SELECT P.*, S.Script
 FROM AppPlugins P WITH (NOLOCK)
 LEFT JOIN AppScripts S WITH (NOLOCK) ON P.AppScriptsID=S.AppScriptsID
 WHERE P.AppPluginsId=@AppPluginsId
END


GO



