CREATE OR ALTER PROCEDURE [dbo].[spui_AppTemplatesData] @AppTemplatesId int
AS
BEGIN
 SELECT *
 FROM   AppTemplatesData a WITH (NOLOCK)
 WHERE  AppTemplatesId = @AppTemplatesId
END


GO


