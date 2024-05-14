CREATE OR ALTER PROCEDURE [dbo].[spui_AppDfClassesList] @dfClassesId int = NULL
AS
BEGIN
  SELECT *, 
         [Value]=dfClassesID,
         ImageIndex = 255
  FROM dfClasses d WITH (NOLOCK)
  WHERE (d.dfClassesId = @dfClassesId) OR (@dfClassesId IS NULL)
END


GO



