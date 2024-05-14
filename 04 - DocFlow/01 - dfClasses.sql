CREATE TABLE [dfClasses](
	[dfClassesId] [int] NOT NULL PRIMARY KEY,
	[Caption] [varchar](255) NOT NULL,
	[MainTable] [varchar](80) NOT NULL,
	[KeyField] [varchar](80),
	[DataView] [varchar](80) NOT NULL DEFAULT '',
	[RoutingKey] [varchar](255) NOT NULL,
	[FullAccess] [bit] NOT NULL DEFAULT 1,
	[CanAddFromDesktop] [bit] NOT NULL DEFAULT 1,
	[AppDialogsId] [int] NULL,
	[EnableDfEvents] [bit] NOT NULL DEFAULT 0,
	[LogProviderName] VARCHAR(255),
	[HistoryProviderName] VARCHAR(255)
)

GO


