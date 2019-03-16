SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [Dimension].[Customer] (
		[Customer Key]         [int] NOT NULL,
		[WWI Customer ID]      [int] NOT NULL,
		[Customer]             [nvarchar](100) COLLATE Latin1_General_100_CI_AS NOT NULL,
		[Bill To Customer]     [nvarchar](100) COLLATE Latin1_General_100_CI_AS NOT NULL,
		[Category]             [nvarchar](50) COLLATE Latin1_General_100_CI_AS NOT NULL,
		[Buying Group]         [nvarchar](50) COLLATE Latin1_General_100_CI_AS NOT NULL,
		[Primary Contact]      [nvarchar](50) COLLATE Latin1_General_100_CI_AS NOT NULL,
		[Postal Code]          [nvarchar](10) COLLATE Latin1_General_100_CI_AS NOT NULL,
		[Valid From]           [datetime2](7) NOT NULL,
		[Valid To]             [datetime2](7) NOT NULL,
		[Lineage Key]          [int] NOT NULL,
		CONSTRAINT [PK_Dimension_Customer]
		PRIMARY KEY
		CLUSTERED
		([Customer Key])
	ON [USERDATA]
) ON [USERDATA]
GO
ALTER TABLE [Dimension].[Customer]
	ADD
	CONSTRAINT [DF_Dimension_Customer_Customer_Key]
	DEFAULT (NEXT VALUE FOR [Sequences].[CustomerKey]) FOR [Customer Key]
GO
CREATE NONCLUSTERED INDEX [IX_Dimension_Customer_WWICustomerID]
	ON [Dimension].[Customer] ([WWI Customer ID], [Valid From], [Valid To])
	ON [USERDATA]
GO
EXEC sp_addextendedproperty N'Description', N'Allows quickly locating by WWI ID', 'SCHEMA', N'Dimension', 'TABLE', N'Customer', 'INDEX', N'IX_Dimension_Customer_WWICustomerID'
GO
EXEC sp_addextendedproperty N'Description', N'Customer dimension', 'SCHEMA', N'Dimension', 'TABLE', N'Customer', NULL, NULL
GO
EXEC sp_addextendedproperty N'Description', N'DW key for the customer dimension', 'SCHEMA', N'Dimension', 'TABLE', N'Customer', 'COLUMN', N'Customer Key'
GO
EXEC sp_addextendedproperty N'Description', N'Numeric ID used for reference to a customer within the WWI database', 'SCHEMA', N'Dimension', 'TABLE', N'Customer', 'COLUMN', N'WWI Customer ID'
GO
EXEC sp_addextendedproperty N'Description', N'Customer''s full name (usually a trading name)', 'SCHEMA', N'Dimension', 'TABLE', N'Customer', 'COLUMN', N'Customer'
GO
EXEC sp_addextendedproperty N'Description', N'Bill to customer''s full name', 'SCHEMA', N'Dimension', 'TABLE', N'Customer', 'COLUMN', N'Bill To Customer'
GO
EXEC sp_addextendedproperty N'Description', N'Customer''s category', 'SCHEMA', N'Dimension', 'TABLE', N'Customer', 'COLUMN', N'Category'
GO
EXEC sp_addextendedproperty N'Description', N'Customer''s buying group', 'SCHEMA', N'Dimension', 'TABLE', N'Customer', 'COLUMN', N'Buying Group'
GO
EXEC sp_addextendedproperty N'Description', N'Primary contact', 'SCHEMA', N'Dimension', 'TABLE', N'Customer', 'COLUMN', N'Primary Contact'
GO
EXEC sp_addextendedproperty N'Description', N'Delivery postal code for the customer', 'SCHEMA', N'Dimension', 'TABLE', N'Customer', 'COLUMN', N'Postal Code'
GO
EXEC sp_addextendedproperty N'Description', N'Valid from this date and time', 'SCHEMA', N'Dimension', 'TABLE', N'Customer', 'COLUMN', N'Valid From'
GO
EXEC sp_addextendedproperty N'Description', N'Valid until this date and time', 'SCHEMA', N'Dimension', 'TABLE', N'Customer', 'COLUMN', N'Valid To'
GO
EXEC sp_addextendedproperty N'Description', N'Lineage Key for the data load for this row', 'SCHEMA', N'Dimension', 'TABLE', N'Customer', 'COLUMN', N'Lineage Key'
GO
ALTER TABLE [Dimension].[Customer] SET (LOCK_ESCALATION = TABLE)
GO
