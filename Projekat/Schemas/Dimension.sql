CREATE SCHEMA [Dimension]
	AUTHORIZATION [dbo]
GO
EXEC sp_addextendedproperty N'Description', N'Dimensional model dimension tables', 'SCHEMA', N'Dimension', NULL, NULL, NULL, NULL
GO
