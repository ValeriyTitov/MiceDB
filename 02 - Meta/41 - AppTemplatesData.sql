/*

Meta SQL Script for Mice 6 
This is used to create Meta(Main) part of Mice 6
Titov Valeriy, 2022

Мета скрипт для Майс 6
Используется для создания основной Мета-части Майс 6
Титов Валерий, 2022

https://github.com/ValeriyTitov/MiceDB

*/

CREATE TABLE [dbo].[AppTemplatesData]
(
	[AppTemplatesDataId] [int] NOT NULL PRIMARY KEY,
	[AppTemplatesId] [int] NOT NULL FOREIGN KEY (AppTemplatesId) REFERENCES AppTemplates(AppTemplatesId) ON DELETE CASCADE INDEX idx_AppTemplatesId,
	[ParentId] [int] NULL, 
	[Active] [bit] NOT NULL,
	[OrderId] [int] NULL,
	[TagName] [varchar](255) NOT NULL,
	[TagType] [int] NOT NULL,
	[ValueSource] [int] NOT NULL,
	[DataSetName] [varchar](32) NULL,
	[Value] [varchar](255) NULL,
	[DataSetFilter] [varchar](80) NULL,
	[DefaultValue] [varchar](80) NULL,
	[CreateCondition] [int] NOT NULL,
	[CreateConditionValue] [varchar](64) NULL,
	[Format] [varchar](32) NULL,
	[Description] [varchar](255) NULL,
	[ValueType] INT NOT NULL
)

GO


ALTER TABLE [dbo].[appTemplatesData] ADD  DEFAULT ((1)) FOR [Active]
GO

ALTER TABLE [dbo].[appTemplatesData] ADD  DEFAULT ((0)) FOR [ValueSource]
GO

ALTER TABLE [dbo].[appTemplatesData] ADD  DEFAULT ((0)) FOR [CreateCondition]
GO


