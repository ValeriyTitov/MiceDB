CREATE OR ALTER PROCEDURE [dbo].[spui_dfClassInfo] @dfClassesId int
AS
BEGIN
 SELECT *
 FROM dfClasses d WITH (NOLOCK)
 WHERE dfClassesId=@dfClassesId
END


GO


