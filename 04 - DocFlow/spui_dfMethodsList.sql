CREATE OR ALTER   PROCEDURE [dbo].[spui_dfMethodsList] @dfTypesId int
AS
BEGIN
 SELECT *
 FROM dfMethods D WITH (NOLOCK)
 WHERE D.dfTypesId = @dfTypesId
END


GO


