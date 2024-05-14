CREATE OR ALTER PROCEDURE [dbo].[spui_AppTemplatesDataSetList] @AppTemplatesId int
AS
BEGIN
 SELECT *
 FROM   AppTemplatesDataSets a WITH (NOLOCK)
 WHERE  AppTemplatesId = @AppTemplatesId
END


GO


