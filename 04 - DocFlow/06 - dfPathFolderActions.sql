CREATE TABLE [dfPathFolderActions]
(
	[dfPathFolderActionsId] [int] PRIMARY KEY,
	[dfPathFoldersId] [int] NOT NULL FOREIGN KEY (dfPathFoldersId) REFERENCES dfPathFolders(dfPathFoldersId) ON DELETE CASCADE INDEX idx_dfPathFoldersId,
	[Active] [bit] NOT NULL DEFAULT 1,
	[OnError] int NOT NULL,
	[ActionType] int NOT NULL,
	[PushOrRollback] int NOT NULL,
	[RunSynchro] bit NOT NULL,
	[RequiresTransaction] bit NOT NULL,
	[OrderId] int NOT NULL,
	[Caption] VARCHAR(255) NOT NULL,
	[UseExpression] bit NOT NULL,
	[Expression] VARCHAR(2048),
	[ProviderName] VARCHAR(255),
    [DBName] VARCHAR(32),
	[ImageIndex] int,
	[VisibleToUser] [bit] NOT NULL DEFAULT 1,
	[UserInformation] VARCHAR(255)
)

GO

