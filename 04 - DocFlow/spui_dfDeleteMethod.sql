CREATE OR ALTER PROCEDURE [dbo].[spui_dfDeleteMethod] @dfMethodsId int
AS
BEGIN
 DELETE dfMethods
 WHERE dfMethodsId=@dfMethodsId
END


GO


