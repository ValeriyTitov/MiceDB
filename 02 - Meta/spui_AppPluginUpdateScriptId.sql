CREATE OR ALTER PROCEDURE [dbo].[spui_AppPluginUpdateScriptId] @AppPluginsId int, @AppScriptsId int
AS
BEGIN
 UPDATE AppPlugins
 SET AppScriptsId = @AppScriptsId
 WHERE AppPluginsId = @AppPluginsId
END


GO


