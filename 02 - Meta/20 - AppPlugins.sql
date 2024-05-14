/*

Meta SQL Script for Mice 6 
This is used to create Meta(Main) part of Mice 6
Titov Valeriy, 2022

Мета скрипт для Майс 6
Используется для создания основной Мета-части Майс 6
Титов Валерий, 2022

https://github.com/ValeriyTitov/MiceDB

*/


CREATE TABLE [dbo].[AppPlugins]
(
	[AppPluginsId] [int] NOT NULL PRIMARY KEY,
	[PluginType] [int] NOT NULL,
	[Name] [varchar](64) NOT NULL,
	[Description] [varchar](MAX) NULL,
	[KeyField] [varchar](32) NULL,
	[ParentIdField] [varchar](32) NULL,
	[DocFlow] [bit] NOT NULL,
	[ProviderName] [varchar](255) NULL,
	[DelProviderName] [varchar](255) NULL,
	[DBName] [varchar](32) NULL,
	[dfClassesId] [int] NULL,
	[AppDialogsId] [int] NULL,
	[AppDialogsIdField] [varchar](32) NULL,
	[AppDialogLayoutsIdField] [varchar](80) NULL,
	[AppScriptsId] [int] NULL FOREIGN KEY (AppScriptsId) REFERENCES AppScripts(AppScriptsId),
	[SummuryFiled] [varchar](32) NULL,
	[bgColorField] [varchar](32) NULL,
	[FontColorField] [varchar](32) NULL,
	[FontStyleField] [varchar](32) NULL,
	[ImageIndexField] [varchar](32) NULL,
	[ShowDocClasses] [bit] NULL,
	[ShowDocFolder] [bit] NULL,
	[AutoWidth] [bit] NULL,
	[Sorting] [bit] NULL,
	[FullExpand] [bit] NULL,
	[ExpandLevel] [int] NULL,
	[ReadOnly] [bit] NULL,
	[GroupByPanel] [bit] NULL,
	[SideTreeEnabled] [bit] NOT NULL,
	[SideTreeProviderName] [varchar](255) NULL,
	[SideTreeKeyField] [varchar](32) NULL,
	[SideTreeParentField] [varchar](32) NULL,
	[SideTreeParamName] [varchar](32) NULL,
	[SideTreeExpandLevel] [int] NULL,
	[SideTreeCaptionField] [varchar](32) NULL,
	[DefaultAppCmdId] [int] NULL,
	[RefreshAfterCreate] [bit] NULL,
	[InitString] [varchar](MAX) NULL
)

GO


ALTER TABLE [dbo].[AppPlugins] ADD  DEFAULT ((0)) FOR [DocFlow]
GO

ALTER TABLE [dbo].[AppPlugins] ADD  DEFAULT ((0)) FOR [ShowDocClasses]
GO

ALTER TABLE [dbo].[AppPlugins] ADD  DEFAULT ((0)) FOR [ShowDocFolder]
GO


