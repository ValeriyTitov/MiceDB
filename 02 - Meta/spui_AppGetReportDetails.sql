CREATE OR ALTER PROCEDURE [dbo].[spui_AppGetReportDetails] @AppReportsId int
AS
BEGIN
 SELECT * 
 FROM [AppReports] R WITH (NOLOCK) 
 WHERE R.AppReportsId=@AppReportsId
END

GO



