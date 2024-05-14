CREATE TABLE [dbo].[dfTypes]
(
	[dfTypesId] [int] NOT NULL PRIMARY KEY,
	[dfClassesId] [int] NOT NULL FOREIGN KEY (dfClassesId) REFERENCES dfClasses(dfClassesId) INDEX idx_dfClassesId,
	[Caption] [varchar](255) NOT NULL,
	[ShortName] [varchar](64) NULL,
	[FullAccess] [bit] NOT NULL DEFAULT 1,
	[CanAddFromDesktop] [bit] NOT NULL DEFAULT 1,
	[Scheme] [varbinary](max) NULL
)

GO


