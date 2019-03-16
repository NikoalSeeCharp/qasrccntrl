SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [Fact].[Stock Holding] (
		[Stock Holding Key]           [bigint] IDENTITY(1, 1) NOT NULL,
		[Stock Item Key]              [int] NOT NULL,
		[Quantity On Hand]            [int] NOT NULL,
		[Bin Location]                [nvarchar](20) COLLATE Latin1_General_100_CI_AS NOT NULL,
		[Last Stocktake Quantity]     [int] NOT NULL,
		[Last Cost Price]             [decimal](18, 2) NOT NULL,
		[Reorder Level]               [int] NOT NULL,
		[Target Stock Level]          [int] NOT NULL,
		[Lineage Key]                 [int] NOT NULL,
		CONSTRAINT [PK_Fact_Stock_Holding]
		PRIMARY KEY
		NONCLUSTERED
		([Stock Holding Key])
	ON [USERDATA]
) ON [USERDATA]
GO
ALTER TABLE [Fact].[Stock Holding]
	WITH CHECK
	ADD CONSTRAINT [FK_Fact_Stock_Holding_Stock_Item_Key_Dimension_Stock Item]
	FOREIGN KEY ([Stock Item Key]) REFERENCES [Dimension].[Stock Item] ([Stock Item Key])
ALTER TABLE [Fact].[Stock Holding]
	CHECK CONSTRAINT [FK_Fact_Stock_Holding_Stock_Item_Key_Dimension_Stock Item]

GO
CREATE CLUSTERED COLUMNSTORE INDEX [CCX_Fact_Stock_Holding]
	ON [Fact].[Stock Holding]
	ON [USERDATA]
GO
CREATE NONCLUSTERED INDEX [FK_Fact_Stock_Holding_Stock_Item_Key]
	ON [Fact].[Stock Holding] ([Stock Item Key])
	ON [USERDATA]
GO
EXEC sp_addextendedproperty N'Description', N'Auto-created to support a foreign key', 'SCHEMA', N'Fact', 'TABLE', N'Stock Holding', 'INDEX', N'FK_Fact_Stock_Holding_Stock_Item_Key'
GO
EXEC sp_addextendedproperty N'Description', N'Holdings of stock items', 'SCHEMA', N'Fact', 'TABLE', N'Stock Holding', NULL, NULL
GO
EXEC sp_addextendedproperty N'Description', N'DW key for a row in the Stock Holding fact', 'SCHEMA', N'Fact', 'TABLE', N'Stock Holding', 'COLUMN', N'Stock Holding Key'
GO
EXEC sp_addextendedproperty N'Description', N'Stock item being held', 'SCHEMA', N'Fact', 'TABLE', N'Stock Holding', 'COLUMN', N'Stock Item Key'
GO
EXEC sp_addextendedproperty N'Description', N'Quantity on hand', 'SCHEMA', N'Fact', 'TABLE', N'Stock Holding', 'COLUMN', N'Quantity On Hand'
GO
EXEC sp_addextendedproperty N'Description', N'Bin location (where is this stock in the warehouse)', 'SCHEMA', N'Fact', 'TABLE', N'Stock Holding', 'COLUMN', N'Bin Location'
GO
EXEC sp_addextendedproperty N'Description', N'Quantity present at last stocktake', 'SCHEMA', N'Fact', 'TABLE', N'Stock Holding', 'COLUMN', N'Last Stocktake Quantity'
GO
EXEC sp_addextendedproperty N'Description', N'Unit cost when the stock item was last purchased', 'SCHEMA', N'Fact', 'TABLE', N'Stock Holding', 'COLUMN', N'Last Cost Price'
GO
EXEC sp_addextendedproperty N'Description', N'Quantity below which reordering should take place', 'SCHEMA', N'Fact', 'TABLE', N'Stock Holding', 'COLUMN', N'Reorder Level'
GO
EXEC sp_addextendedproperty N'Description', N'Typical stock level held', 'SCHEMA', N'Fact', 'TABLE', N'Stock Holding', 'COLUMN', N'Target Stock Level'
GO
EXEC sp_addextendedproperty N'Description', N'Lineage Key for the data load for this row', 'SCHEMA', N'Fact', 'TABLE', N'Stock Holding', 'COLUMN', N'Lineage Key'
GO
ALTER TABLE [Fact].[Stock Holding] SET (LOCK_ESCALATION = TABLE)
GO
