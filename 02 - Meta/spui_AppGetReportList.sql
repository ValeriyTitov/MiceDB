CREATE OR ALTER PROCEDURE [dbo].[spui_AppGetReportList] @SearchStr VARCHAR(255) = NULL
AS
BEGIN
 SELECT AppReportsID, 
        Caption, 
		[Description], 
		Active, 
		CreateDate
FROM  AppReports AS R WITH (NOLOCK)
WHERE @SearchStr IS NULL OR CONVERT(VARCHAR(8), R.AppReportsID)=@SearchStr OR R.Caption LIKE '%'+@SearchStr+'%'
END


GO


