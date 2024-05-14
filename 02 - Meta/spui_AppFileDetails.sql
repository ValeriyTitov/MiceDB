CREATE OR ALTER PROCEDURE [dbo].[spui_AppFileDetails] @AppBinaryFilesId int
AS
BEGIN
 SELECT AppBinaryFilesId, 
		[FileName], 
		[Description], 
		[CreateUser],
		Size = CASE
		        WHEN AData IS NULL THEN 0
				ELSE LEN(AData)
               END
 FROM   AppBinaryFiles WITH (NOLOCK)
 WHERE  AppBinaryFilesId=@AppBinaryFilesId
END

GO


