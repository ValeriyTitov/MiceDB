CREATE OR ALTER PROCEDURE [dbo].[spui_dfGetDocumentSchema]  @dfTypesId int
AS
BEGIN
 SELECT d.*, c.LogProviderName, c.HistoryProviderName
 FROM  dfTypes d WITH (NOLOCK)
 INNER JOIN dfClasses c WITH (NOLOCK) ON c.dfClassesId=d.dfClassesId
 WHERE d.dfTypesId=@dfTypesId
END


GO


