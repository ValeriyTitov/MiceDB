/*

Meta SQL Script for Mice 6 
This is used to create Meta(Main) part of Mice 6
Titov Valeriy, 2022

Мета скрипт для Майс 6
Используется для создания основной Мета-части Майс 6
Титов Валерий, 2022

https://github.com/ValeriyTitov/MiceDB

*/

CREATE TABLE [dbo].[AppColumns]
(
	[AppColumnsId] [int] NOT NULL PRIMARY KEY,
	[AppPluginsId] [int] NULL FOREIGN KEY (AppPluginsId) REFERENCES AppPlugins(AppPluginsId) ON DELETE CASCADE INDEX idx_AppPluginsId,
	[AppDialogControlsId] [int] NULL FOREIGN KEY (AppDialogControlsId) REFERENCES AppDialogControls(AppDialogControlsId) ON DELETE CASCADE INDEX idx_AppDialogControlsId,
	[ParentId] [int] NULL,
	[ColType] [int] NOT NULL,
	[FieldName] [varchar](80) NULL INDEX idx_FieldName,
	[ColumnName] VARCHAR(255) NOT NULL,
	[Caption] [varchar](256) NOT NULL,
	[Visible] [bit] NOT NULL,
	[Align] [int] NOT NULL,
	[Width] [int] NOT NULL,
	[Sizing] [bit] NOT NULL,
	[Filter] [bit] NOT NULL,
	[ReadOnly] [bit] NOT NULL,
	[CreateOrder] [int] NOT NULL,
	[SortOrder] [int] NOT NULL,
	[SummaryField] [varchar](32) NULL,
	[SummaryType] [int] NULL,
	[SummaryFormat] [varchar](32) NULL,
	[ParamName] [varchar](32) NULL,
	[IsBand] [bit] NOT NULL,
	[Fixed] [int] NOT NULL,
	[CardVisible] [bit] NOT NULL,
	[CardBand] [bit] NOT NULL,
	[AppCmdId] [int] NULL FOREIGN KEY (AppCmdId) REFERENCES AppCmd(AppCmdId),
	[Moving] [bit] NULL,
	[HeaderHint] [varchar](2048) NULL,
	[CellHintField] [varchar](80) NULL,
	[InitString] [varchar](max) NULL
)

ALTER TABLE [dbo].[AppColumns] ADD  DEFAULT ((0)) FOR [ColType]
GO

ALTER TABLE [dbo].[AppColumns] ADD  DEFAULT ((1)) FOR [Visible]
GO

ALTER TABLE [dbo].[AppColumns] ADD  DEFAULT ((1)) FOR [Align]
GO

ALTER TABLE [dbo].[AppColumns] ADD  DEFAULT ((100)) FOR [Width]
GO

ALTER TABLE [dbo].[AppColumns] ADD  DEFAULT ((1)) FOR [Sizing]
GO

ALTER TABLE [dbo].[AppColumns] ADD  DEFAULT ((0)) FOR [Filter]
GO

ALTER TABLE [dbo].[AppColumns] ADD  DEFAULT ((1)) FOR [ReadOnly]
GO

ALTER TABLE [dbo].[AppColumns] ADD  DEFAULT ((0)) FOR [CreateOrder]
GO

ALTER TABLE [dbo].[AppColumns] ADD  DEFAULT ((0)) FOR [SortOrder]
GO

ALTER TABLE [dbo].[AppColumns] ADD  DEFAULT ((0)) FOR [IsBand]
GO

ALTER TABLE [dbo].[AppColumns] ADD  DEFAULT ((0)) FOR [Fixed]
GO

ALTER TABLE [dbo].[AppColumns] ADD  DEFAULT ((1)) FOR [CardVisible]
GO

ALTER TABLE [dbo].[AppColumns] ADD  DEFAULT ((0)) FOR [CardBand]
GO

CREATE UNIQUE INDEX uix_ColumnNamePlugin
ON AppColumns(AppPluginsId, ColumnName)
WHERE AppDialogControlsId IS NULL
GO


CREATE UNIQUE INDEX uix_ColumnNameContol
ON AppColumns(AppDialogControlsId, ColumnName)
WHERE  AppPluginsId IS NULL
GO



