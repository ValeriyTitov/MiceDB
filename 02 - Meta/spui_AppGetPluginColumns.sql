CREATE OR ALTER PROCEDURE [dbo].[spui_AppGetPluginColumns] @AppPluginsId int
AS
BEGIN
 SELECT *
 FROM AppColumns C WITH (NOLOCK)
 WHERE C.AppPluginsId=@AppPluginsId
 ORDER BY CreateOrder
END


GO


