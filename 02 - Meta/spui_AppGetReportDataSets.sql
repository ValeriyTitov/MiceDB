CREATE OR ALTER PROCEDURE [dbo].[spui_AppGetReportDataSets] @AppReportsId int
AS
BEGIN
 SELECT * 
 FROM [AppReportsDataSets] D WITH (NOLOCK) 
 WHERE D.AppReportsId=@AppReportsId
END

GO


