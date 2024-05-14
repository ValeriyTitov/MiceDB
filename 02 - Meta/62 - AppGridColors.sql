/*

Meta SQL Script for Mice 6 
This is used to create Meta(Main) part of Mice 6
Titov Valeriy, 2022

Мета скрипт для Майс 6
Используется для создания основной Мета-части Майс 6
Титов Валерий, 2022

https://github.com/ValeriyTitov/MiceDB

*/

CREATE TABLE [dbo].[AppGridColors]
(
	[AppGridColorsId] [int] NOT NULL PRIMARY KEY,
	[AppPluginsId] [int] NULL FOREIGN KEY (AppPluginsId) REFERENCES AppPlugins(AppPluginsId) ON DELETE CASCADE INDEX idx_AppPluginsId,
	[AppDialogControlsId] [int] NULL FOREIGN KEY (AppDialogControlsId) REFERENCES AppDialogControls(AppDialogControlsId) ON DELETE CASCADE INDEX idx_AppDialogControlsId,
	[CreateOrder] [int] NOT NULL,
	[FieldName] [varchar](32) NOT NULL,
	[Sign] [smallint] NOT NULL,
	[Value] [varchar](80) NULL,
	[BgColor] [int] NULL,
	[Color] [int] NULL,
	[Bold] [bit] NOT NULL,
	[Italic] [bit] NOT NULL,
	[WholeRow] [bit] NOT NULL
)

GO

ALTER TABLE [dbo].[AppGridColors] ADD  DEFAULT ((0)) FOR [Sign]
GO

ALTER TABLE [dbo].[AppGridColors] ADD  DEFAULT ((0)) FOR [Bold]
GO

ALTER TABLE [dbo].[AppGridColors] ADD  DEFAULT ((0)) FOR [Italic]
GO

ALTER TABLE [dbo].[AppGridColors] ADD  DEFAULT ((0)) FOR [WholeRow]
GO


