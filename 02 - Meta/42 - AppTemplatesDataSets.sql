/*

Meta SQL Script for Mice 6 
This is used to create Meta(Main) part of Mice 6
Titov Valeriy, 2022

Мета скрипт для Майс 6
Используется для создания основной Мета-части Майс 6
Титов Валерий, 2022

https://github.com/ValeriyTitov/MiceDB

*/


CREATE TABLE [dbo].[AppTemplatesDataSets](
	[AppTemplatesDataSetsId] [int] NOT NULL PRIMARY KEY,
	[AppTemplatesId] [int] NOT NULL FOREIGN KEY (AppTemplatesId) REFERENCES AppTemplates(AppTemplatesId) ON DELETE CASCADE INDEX idx_AppTemplatesId,
	[DataSetName] [varchar](80) NOT NULL,
	[ProviderName] [varchar](80) NOT NULL,
	[DBName] [varchar](16) NULL
)

GO


