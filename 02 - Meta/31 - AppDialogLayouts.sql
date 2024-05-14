/*

Meta SQL Script for Mice 6 
This is used to create Meta(Main) part of Mice 6
Titov Valeriy, 2022

Мета скрипт для Майс 6
Используется для создания основной Мета-части Майс 6
Титов Валерий, 2022

https://github.com/ValeriyTitov/MiceDB

*/


CREATE TABLE [dbo].[AppDialogsLayout](
	[AppDialogsLayoutId] [int] NOT NULL PRIMARY KEY,
	[AppDialogsId] [int] NOT NULL FOREIGN KEY (AppDialogsId) REFERENCES AppDialogs(AppDialogsId) INDEX idx_AppDialogsId,
	[Active] [bit] NOT NULL,
	[ReadOnly] [bit] NOT NULL,
	[StreamInput] [bit] NOT NULL,
	[Description] [varchar](127) NULL,
	[Layout] [varchar](max) NULL,
	[OrderId] [int] NULL,
	[FullAccess] [bit] NOT NULL,
	[Sizeable] [bit] NOT NULL,
	[AppScriptsId] [int] NULL FOREIGN KEY (AppScriptsId) REFERENCES AppScripts(AppScriptsId),
	[Width] [int] NULL,
	[Height] [int] NULL,
)

ALTER TABLE [dbo].[appDialogsLayout] ADD  DEFAULT ((0)) FOR [ReadOnly]
GO

ALTER TABLE [dbo].[appDialogsLayout] ADD  DEFAULT ((0)) FOR [StreamInput]
GO

ALTER TABLE [dbo].[appDialogsLayout] ADD  DEFAULT ((1)) FOR [FullAccess]
GO

ALTER TABLE [dbo].[appDialogsLayout] ADD  DEFAULT ((1)) FOR [Active]
GO

ALTER TABLE [dbo].[appDialogsLayout] ADD  DEFAULT ((0)) FOR [Sizeable]
GO


