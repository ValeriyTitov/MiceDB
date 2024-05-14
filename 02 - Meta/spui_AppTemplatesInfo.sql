CREATE OR ALTER PROCEDURE [dbo].[spui_AppTemplatesInfo] @AppTemplatesId int
AS
BEGIN
 SELECT *
 FROM   AppTemplates a WITH (NOLOCK)
 WHERE  AppTemplatesId = @AppTemplatesId
END


GO


