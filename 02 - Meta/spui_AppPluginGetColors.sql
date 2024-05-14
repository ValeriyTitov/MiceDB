CREATE OR ALTER PROCEDURE [dbo].[spui_AppPluginGetColors] @AppPluginsId int
AS
BEGIN
 SELECT *
 FROM AppGridColors A WITH (NOLOCK)
 WHERE A.AppPluginsId=@AppPluginsId
 ORDER BY A.CreateOrder 
END


GO


