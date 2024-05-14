/*

Meta SQL Script for Mice 6 
This is used to create Meta(Main) part of Mice 6
Titov Valeriy, 2022

Мета скрипт для Майс 6
Используется для создания основной Мета-части Майс 6
Титов Валерий, 2022

https://github.com/ValeriyTitov/MiceDB

*/

CREATE TABLE [dbo].[AppReportsParams]
(
	[AppReportsParamsId] [int] NOT NULL,
	[AppReportsId] [int] NOT NULL FOREIGN KEY (AppReportsId) REFERENCES AppReports(AppReportsId) ON DELETE CASCADE INDEX idx_AppReportsId,
	[ParamName] [varchar](255) NOT NULL,
	[ParamValue] [varchar](255) NOT NULL,
)
GO


