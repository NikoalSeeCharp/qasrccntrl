CREATE SCHEMA [Fact]
	AUTHORIZATION [dbo]
GO
EXEC sp_addextendedproperty N'Description', N'Dimensional model fact tables', 'SCHEMA', N'Fact', NULL, NULL, NULL, NULL
GO
