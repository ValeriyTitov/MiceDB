CREATE OR ALTER PROCEDURE [dbo].[spsys_GetProcedureParams] @ProcedureName VARCHAR(128) 
AS
BEGIN


IF NOT EXISTS
(SELECT 1
FROM         INFORMATION_SCHEMA.ROUTINES AS R
WHERE        (SPECIFIC_NAME = @ProcedureName COLLATE cyrillic_general_ci_as AND ROUTINE_TYPE='PROCEDURE')
)
 BEGIN
--resourcestring
  DECLARE @Message VARCHAR(255) = FORMATMESSAGE('[spsys_GetProcedureParams] Stored procedure not found - %s on database %s', @ProcedureName,DB_NAME());
  THROW 51000,@Message, 1;  
 END

SELECT       ORDINAL_POSITION, 
             PARAMETER_NAME,
			 DATA_TYPE,
			 PARAMETER_MODE, 
			 CHARACTER_MAXIMUM_LENGTH, 
             CHARACTER_OCTET_LENGTH, 
			 NUMERIC_PRECISION, 
			 NUMERIC_SCALE

FROM         INFORMATION_SCHEMA.PARAMETERS AS R
WHERE        (SPECIFIC_NAME = @ProcedureName COLLATE cyrillic_general_ci_as)

ORDER BY ORDINAL_POSITION
END

GO



