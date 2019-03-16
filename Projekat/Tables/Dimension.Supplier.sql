SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [Dimension].[Supplier] (
		[Supplier Key]           [int] NOT NULL,
		[WWI Supplier ID]        [int] NOT NULL,
		[Supplier]               [nvarchar](100) COLLATE Latin1_General_100_CI_AS NOT NULL,
		[Category]               [nvarchar](50) COLLATE Latin1_General_100_CI_AS NOT NULL,
		[Primary Contact]        [nvarchar](50) COLLATE Latin1_General_100_CI_AS NOT NULL,
		[Supplier Reference]     [nvarchar](20) COLLATE Latin1_General_100_CI_AS NULL,
		[Payment Days]           [int] NOT NULL,
		[Postal Code]            [nvarchar](10) COLLATE Latin1_General_100_CI_AS NOT NULL,
		[Valid From]             [datetime2](7) NOT NULL,
		[Valid To]               [datetime2](7) NOT NULL,
		[Lineage Key]            [int] NOT NULL,
		CONSTRAINT [PK_Dimension_Supplier]
		PRIMARY KEY
		CLUSTERED
		([Supplier Key])
	ON [USERDATA]
) ON [USERDATA]
GO
ALTER TABLE [Dimension].[Supplier]
	ADD
	CONSTRAINT [DF_Dimension_Supplier_Supplier_Key]
	DEFAULT (NEXT VALUE FOR [Sequences].[SupplierKey]) FOR [Supplier Key]
GO
CREATE NONCLUSTERED INDEX [IX_Dimension_Supplier_WWISupplierID]
	ON [Dimension].[Supplier] ([WWI Supplier ID], [Valid From], [Valid To])
	ON [USERDATA]
GO
EXEC sp_addextendedproperty N'Description', N'Allows quickly locating by WWI ID', 'SCHEMA', N'Dimension', 'TABLE', N'Supplier', 'INDEX', N'IX_Dimension_Supplier_WWISupplierID'
GO
EXEC sp_addextendedproperty N'Description', N'Supplier dimension', 'SCHEMA', N'Dimension', 'TABLE', N'Supplier', NULL, NULL
GO
EXEC sp_addextendedproperty N'Description', N'DW key for the supplier dimension', 'SCHEMA', N'Dimension', 'TABLE', N'Supplier', 'COLUMN', N'Supplier Key'
GO
EXEC sp_addextendedproperty N'Description', N'Numeric ID used for reference to a supplier within the WWI database', 'SCHEMA', N'Dimension', 'TABLE', N'Supplier', 'COLUMN', N'WWI Supplier ID'
GO
EXEC sp_addextendedproperty N'Description', N'Supplier''s full name (usually a trading name)', 'SCHEMA', N'Dimension', 'TABLE', N'Supplier', 'COLUMN', N'Supplier'
GO
EXEC sp_addextendedproperty N'Description', N'Supplier''s category', 'SCHEMA', N'Dimension', 'TABLE', N'Supplier', 'COLUMN', N'Category'
GO
EXEC sp_addextendedproperty N'Description', N'Primary contact', 'SCHEMA', N'Dimension', 'TABLE', N'Supplier', 'COLUMN', N'Primary Contact'
GO
EXEC sp_addextendedproperty N'Description', N'Supplier reference for our organization (might be our account number at the supplier)', 'SCHEMA', N'Dimension', 'TABLE', N'Supplier', 'COLUMN', N'Supplier Reference'
GO
EXEC sp_addextendedproperty N'Description', N'Number of days for payment of an invoice (ie payment terms)', 'SCHEMA', N'Dimension', 'TABLE', N'Supplier', 'COLUMN', N'Payment Days'
GO
EXEC sp_addextendedproperty N'Description', N'Delivery postal code for the supplier', 'SCHEMA', N'Dimension', 'TABLE', N'Supplier', 'COLUMN', N'Postal Code'
GO
EXEC sp_addextendedproperty N'Description', N'Valid from this date and time', 'SCHEMA', N'Dimension', 'TABLE', N'Supplier', 'COLUMN', N'Valid From'
GO
EXEC sp_addextendedproperty N'Description', N'Valid until this date and time', 'SCHEMA', N'Dimension', 'TABLE', N'Supplier', 'COLUMN', N'Valid To'
GO
EXEC sp_addextendedproperty N'Description', N'Lineage Key for the data load for this row', 'SCHEMA', N'Dimension', 'TABLE', N'Supplier', 'COLUMN', N'Lineage Key'
GO
ALTER TABLE [Dimension].[Supplier] SET (LOCK_ESCALATION = TABLE)
GO
