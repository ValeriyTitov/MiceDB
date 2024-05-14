CREATE TABLE [dfPathFolders]
(
	[dfPathFoldersId] [int] NOT NULL PRIMARY KEY,
	[dfClassesId] [int] NOT NULL FOREIGN KEY (dfClassesId) REFERENCES dfClasses(dfClassesId) INDEX idx_dfClassesId,
	[dfTypesId] [int] NOT NULL   FOREIGN KEY (dfTypesId) REFERENCES dfTypes(dfTypesId) INDEX idx_dfTypesId,
	[FolderType] [int] NOT NULL DEFAULT 0,
	[Caption] [varchar](255) NOT NULL,
	[CodeName] [varchar](32) NULL,
	[Active] [bit] NOT NULL DEFAULT 1,
	[AllowEdit] [bit] NOT NULL DEFAULT 1,
	[AllowDelete] [bit] NOT NULL DEFAULT 1,
	[AllowDesktop] [bit] NOT NULL DEFAULT 1,
	[FullAccessView] [bit] NOT NULL DEFAULT 1,
	[NonStopRule] [varchar](2048) NULL,
	[ImageIndex] [int] NULL,
	[EditdfMethodsId] [int] NULL,
	[AppDialogsLayoutIdEdit] [int] NULL,
	[AppDialogsLayoutIdApply] [int] NULL,
	[AppDialogsLayoutIdFinish] [int] NULL,
	[bgColor] [int] NULL,
	[FontColor] [int] NULL,
	[FontStyle] [int] NULL,
	[EnableMethodSelection] [bit] NOT NULL DEFAULT 1,
	[AutoRoute] [bit] NOT NULL DEFAULT 0,
	[ShowForEach] [bit] NULL,
	[UserInformation] [varchar](MAX) NULL
	
	
)
	
GO

