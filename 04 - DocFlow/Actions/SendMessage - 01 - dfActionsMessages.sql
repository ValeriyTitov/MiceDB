--DROP TABLE [dfActionsMessages]
CREATE TABLE [dfActionsMessages]
(
	dfPathFolderActionsId [int] PRIMARY KEY FOREIGN KEY (dfPathFolderActionsId) REFERENCES dfPathFolderActions(dfPathFolderActionsId) ON DELETE CASCADE,
	MessageType int NOT NULL,
	MessageTo VARCHAR(255),
	MessageSubject VARCHAR(255),
	MessageBody VARCHAR(MAX)
)

GO