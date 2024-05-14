CREATE TABLE [dfPathFolderRules]
(
	[dfPathFolderRulesId] [int] PRIMARY KEY,
	[dfPathFoldersId] [int] NOT NULL FOREIGN KEY (dfPathFoldersId) REFERENCES dfPathFolders(dfPathFoldersId) ON DELETE CASCADE INDEX idx_dfPathFoldersId,
	[Active] [bit] NOT NULL DEFAULT 1,
	[OrderId] INT NOT NULL,
	[Caption] VARCHAR(255) NOT NULL,
	[Expression] VARCHAR(2048),
	[UserMessage] VARCHAR(255) NOT NULL,
	[VisibleToUser] [bit] NOT NULL DEFAULT 1
)

GO


