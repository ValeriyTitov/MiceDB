/*

Meta SQL Script for Mice 6 
This is used to create Meta(Main) part of Mice 6
Titov Valeriy, 2022

Мета скрипт для Майс 6
Используется для создания основной Мета-части Майс 6
Титов Валерий, 2022

https://github.com/ValeriyTitov/MiceDB

*/

CREATE TABLE [dbo].[AppTemplates]
(
	[AppTemplatesId] [int] NOT NULL PRIMARY KEY,
	[Active] [bit] NOT NULL,
	[TemplateType] [int] NOT NULL,
	[Name] [varchar](80) NOT NULL,
	[Description] [varchar](1024) NULL,
	[DefaultDateTimeFormat] [varchar](32) NULL,
	[FormatAfterCreate] [bit] NULL,
	[CreateDate] [datetime] NULL,
)
GO

ALTER TABLE [dbo].[AppTemplates] ADD  DEFAULT ((1)) FOR [Active]
GO

ALTER TABLE [dbo].[AppTemplates] ADD  DEFAULT ((1)) FOR [FormatAfterCreate]
GO

ALTER TABLE [dbo].[AppTemplates] ADD  DEFAULT (getdate()) FOR [CreateDate]
GO


