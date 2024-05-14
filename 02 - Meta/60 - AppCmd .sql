/*

Meta SQL Script for Mice 6 
This is used to create Meta(Main) part of Mice 6
Titov Valeriy, 2022

Мета скрипт для Майс 6
Используется для создания основной Мета-части Майс 6
Титов Валерий, 2022

https://github.com/ValeriyTitov/MiceDB

*/

CREATE TABLE [dbo].[AppCmd](
	[AppCmdId] [int] NOT NULL PRIMARY KEY,
	[AppPluginsId] [int] NULL FOREIGN KEY (AppPluginsId) REFERENCES AppPlugins(AppPluginsId),
	[Active] [bit] NOT NULL,
	[CommandType] [int] NOT NULL,
	[AppearsOn] int NOT NULL,
	[ActionType] [int] NOT NULL,
	[PluginMethod] [varchar](32) NULL,
	[Name] [varchar](32) NOT NULL,
	[Location] [varchar](80) NOT NULL,
	[Caption] [varchar](80) NULL,
	[Description] [varchar](MAX) NULL,
	[Hint] [varchar](MAX) NULL,
	[ImageIndex] [int] NULL,
	[ShortCut] [varchar](32) NULL,
	[ShowCaption] [bit] NULL,
	[Width] [int] NULL,
	[FullAccess] [bit] NOT NULL,
	[CreateOrder] [int] NOT NULL,
	[RunAppPluginsId] [int] NULL FOREIGN KEY (RunAppPluginsId) REFERENCES AppPlugins(AppPluginsId),
	[RunAppScriptsId] [int] NULL FOREIGN KEY (RunAppScriptsId) REFERENCES AppScripts(AppScriptsId),
	[RunAppTemplatesId] [int] NULL FOREIGN KEY (RunAppTemplatesId) REFERENCES AppTemplates(AppTemplatesId),
	[RunAppReportsId] [int] NULL FOREIGN KEY (RunAppReportsId) REFERENCES AppReports(AppReportsId),
	[RunAppDialogsId] [int] NULL FOREIGN KEY (RunAppDialogsId) REFERENCES AppDialogs(AppDialogsId),
	[RunAppDialogPlacement] [int] NULL,
	[ParamName] [varchar](32) NULL,
	[ParamName2] [varchar](32) NULL,
	[SPValue] [varchar](255) NULL,
	[SPValue1] [varchar](255) NULL,
	[SPValue2] [varchar](512) NULL,
	[AlwaysEnabled] [bit] NOT NULL,
	[EnabledNoRecords] [bit] NOT NULL,
	[EnabledFieldName] [varchar](32) NULL,
	[EnabledSign] [smallint] NOT NULL,
	[EnabledValue] [varchar](80) NULL,
	[iType] [int] NOT NULL,
	[AutoRefresh] [bit] NULL,
	[MultiSelectBehavior] [int] NULL,
	[ContinueOnError] [bit] NULL,
	[AppDialogShowBehavior] [int] NULL,
	[InitString] [varchar](MAX) NULL,
)
	
GO

ALTER TABLE [dbo].[AppCmd] ADD  DEFAULT ((1)) FOR [ShowCaption]
GO

ALTER TABLE [dbo].[AppCmd] ADD  DEFAULT ((1)) FOR [FullAccess]
GO

ALTER TABLE [dbo].[AppCmd] ADD  DEFAULT ((100)) FOR [CreateOrder]
GO

ALTER TABLE [dbo].[AppCmd] ADD  DEFAULT ((1)) FOR [Active]
GO

ALTER TABLE [dbo].[AppCmd] ADD  DEFAULT ((1)) FOR [AlwaysEnabled]
GO

ALTER TABLE [dbo].[AppCmd] ADD  DEFAULT ((1)) FOR [EnabledNoRecords]
GO

ALTER TABLE [dbo].[AppCmd] ADD  DEFAULT ((0)) FOR [EnabledSign]
GO

ALTER TABLE [dbo].[AppCmd] ADD  DEFAULT ((1)) FOR [AutoRefresh]
GO


