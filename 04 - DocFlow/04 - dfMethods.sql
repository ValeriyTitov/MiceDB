CREATE TABLE [dfMethods]
(
	[dfMethodsId] [int] NOT NULL PRIMARY KEY,
	[dfClassesId] [int] NOT NULL FOREIGN KEY (dfClassesId) REFERENCES dfClasses(dfClassesId) INDEX idx_dfClassesId,
	[dfTypesId] [int] NOT NULL   FOREIGN KEY (dfTypesId) REFERENCES dfTypes(dfTypesId) INDEX idx_dfTypesId,
	[dfPathFoldersIdSource] [int] NOT NULL FOREIGN KEY (dfPathFoldersIdSource) REFERENCES dfPathFolders(dfPathFoldersId) INDEX idx_dfPathFoldersIdSource,
	[dfPathFoldersIdTarget] [int] NOT NULL FOREIGN KEY (dfPathFoldersIdTarget) REFERENCES dfPathFolders(dfPathFoldersId) INDEX idx_dfPathFoldersIdTarget,
	[Active] bit NOT NULL DEFAULT 1,
	[Caption] [varchar](80) NOT NULL,
	[StateName] [varchar](32) NULL,
	[AllowDesktop] [bit] NOT NULL DEFAULT 1,
	[AllowRollback] [bit] NOT NULL DEFAULT 0,
	[IsDefault] [bit] NOT NULL DEFAULT 0,
	[RunDaily] [bit] NOT NULL DEFAULT 0,
	[FullAccess] [bit] NOT NULL DEFAULT 1,
	[ImageIndex] [int] NULL,
	[Info] [varchar](MAX) NULL,
	[Check_iError] [bit] NOT NULL,
	[UseExpression] [bit] NOT NULL DEFAULT 0,
	[Expression] [varchar](2048) NULL,
	[UserMessage] [varchar](512) NULL
	)

CREATE UNIQUE INDEX uidx_DefaultSource ON [dfMethods] ([IsDefault], [dfPathFoldersIdSource]) WHERE [IsDefault]=1 --Only 1 default method allowed
	
	
GO

