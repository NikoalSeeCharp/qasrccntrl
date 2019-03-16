CREATE SCHEMA [Integration]
	AUTHORIZATION [dbo]
GO
EXEC sp_addextendedproperty N'Description', N'Objects needed for ETL integration', 'SCHEMA', N'Integration', NULL, NULL, NULL, NULL
GO
