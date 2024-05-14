CREATE OR ALTER PROCEDURE [dbo].[spds_DataScriptList]
AS
BEGIN
 SELECT *
 FROM AppScripts A WITH (NOLOCK)
 WHERE (A.Syntax='C#' COLLATE cyrillic_general_ci_as)
END


GO


